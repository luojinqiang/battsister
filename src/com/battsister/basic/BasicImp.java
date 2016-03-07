package com.battsister.basic;

import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.*;

/**
 * Created by 78544 on 3/6/2016.
 */
public abstract class BasicImp implements BasicInterface {

    private Dbc dbc = DbcFactory.getRDbcInstance();
    private Base base = new Base();
    boolean autoCommit = false;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    private String tableName = "";

    @Override
    public int add(Doc doc) {
        int rid = 0;
        try {
            dbc.openConn();
            base.setDbc(dbc, autoCommit);
            rid = base.executeInsertByDoc(getTableName(), doc);
            base.commit();
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            rid = -1;
        } finally {
            dbc.closeConn();
        }
        return rid;
    }

    @Override
    public int updateByWhere(Doc columnDoc, Doc whereDoc) {
        int rid = 0;
        try {
            dbc.openConn();
            base.setDbc(dbc, autoCommit);
            rid = base.executeUpdateByDoc(getTableName(), columnDoc, whereDoc);
            base.commit();
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            rid = -1;
        } finally {
            dbc.closeConn();
        }
        return rid;
    }

    @Override
    public void updateById(Doc columnDoc, Object id) {
        try {
            dbc.openConn();
            base.setDbc(dbc, autoCommit);
            StringBuffer columnDocBuffer = new StringBuffer("select * from " + getTableName() + " where ");
            List valueList = new ArrayList();
            Set set=columnDoc.entrySet();
            Iterator<Map.Entry<String,Object>> ite=set.iterator();
            while (ite.hasNext()) {
                Map.Entry<String,Object> entry=ite.next();
                columnDocBuffer.append(entry.getKey()+"=?,");
                valueList.add(entry.getValue());
            }
            columnDocBuffer.setLength(columnDocBuffer.length()-1);//去掉最后一个空格

            valueList.add(id);
            base.executeUpdate("update " + getTableName() + " set " + columnDocBuffer.toString() + " where id=?", valueList);
            base.commit();
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
        } finally {
            dbc.closeConn();
        }
    }

    @Override
    public int deleteById(Object id) {
        int rid = 0;
        try {
            dbc.openConn();
            base.setDbc(dbc, autoCommit);
            rid = base.executeUpdate("delete from " + getTableName() + " where id=?", new Object[]{id});
            base.commit();
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            rid = -1;
        } finally {
            dbc.closeConn();
        }
        return rid;
    }

    @Override
    public JSONObject queryById(Object id) {
        JSONObject object = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, autoCommit);
            object = base.executeQuery2Jsons("select * from " + getTableName() + " where id=?", new Object[]{id}, 1)[0];
            base.commit();
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
        } finally {
            dbc.closeConn();
        }
        return object;
    }

    @Override
    public JSONObject queryByWhere(Doc whereDoc) {
        JSONObject object = new JSONObject();
        try {
            dbc.openConn();
            base.setDbc(dbc, autoCommit);

            StringBuffer whereBuffer = new StringBuffer("select * from " + getTableName() + " where ");
            List valueList = new ArrayList();
            Set set = whereDoc.entrySet();
            Iterator<Map.Entry<String, Object>> ite = set.iterator();
            while (ite.hasNext()) {
                Map.Entry<String, Object> entry = ite.next();
                if (" in".contains(entry.getKey())) {
                    whereBuffer.append(entry.getKey() + " ? and");
                    valueList.add("(" + entry.getValue() + ")");
                } else {
                    whereBuffer.append(entry.getKey() + "=? and");
                    valueList.add(entry.getValue());
                }
            }

            whereBuffer.setLength(whereBuffer.length() - 4);
            object = base.executeQuery2Jsons(whereBuffer.toString(), valueList, 1)[0];
            base.commit();
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
        } finally {
            dbc.closeConn();
        }
        return object;
    }

    @Override
    public JSONArray queryArrayByWhere(Doc whereDoc) {
        JSONArray array = new JSONArray();
        try {
            dbc.openConn();
            base.setDbc(dbc, autoCommit);

            StringBuffer whereBuffer = new StringBuffer("select * from " + getTableName() + " where ");
            List valueList = new ArrayList();
            String limitStr = "";
            String orderStr = "";
            Set set = whereDoc.entrySet();
            Iterator<Map.Entry<String, Object>> ite = set.iterator();
            while (ite.hasNext()) {
                Map.Entry<String, Object> entry = ite.next();
                switch (entry.getKey()) {
                    case " in":
                        whereBuffer.append(entry.getKey() + " ? and");
                        valueList.add("(" + entry.getValue() + ")");
                    case "@limit":
                        limitStr = " limit " + entry.getValue();
                    case "@order":
                        orderStr = " order by " + entry.getValue();
                    default:
                        whereBuffer.append(entry.getKey() + "=? and");
                        valueList.add(entry.getValue());
                }
            }

            whereBuffer.setLength(whereBuffer.length() - 4);
            array = base.executeQuery2JSONArray(whereBuffer.toString() + orderStr + limitStr, valueList);
            base.commit();
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
        } finally {
            dbc.closeConn();
        }
        return array;
    }

    @Override
    public int queryCountByWhere(Doc whereDoc) {
        int count = 0;
        try {
            dbc.openConn();
            base.setDbc(dbc, autoCommit);

            StringBuffer whereBuffer = new StringBuffer("select count(id) as counts from " + getTableName() + " where ");
            List valueList = new ArrayList();
            Set set = whereDoc.entrySet();
            Iterator<Map.Entry<String, Object>> ite = set.iterator();
            while (ite.hasNext()) {
                Map.Entry<String, Object> entry = ite.next();
                if (" in".contains(entry.getKey())) {
                    whereBuffer.append(entry.getKey() + " ? and");
                    valueList.add("(" + entry.getValue() + ")");
                } else {
                    whereBuffer.append(entry.getKey() + "=? and");
                    valueList.add(entry.getValue());
                }
            }

            whereBuffer.setLength(whereBuffer.length() - 4);
            JSONObject object = base.executeQuery2Jsons(whereBuffer.toString(), valueList, 1)[0];
            if (!object.isEmpty()) {
                count = object.getInt("counts");
            }
            base.commit();
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
        } finally {
            dbc.closeConn();
        }
        return count;
    }
}

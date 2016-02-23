package com.hanyou.timer;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;


public class GessTimerMgr extends TimerTask {

    private Map<String, TimerInstance> timerMap = new ConcurrentHashMap<String, TimerInstance>();

    private static GessTimerMgr instance = null;

    private GessTimerMgr() {
    }

    private static Timer timer = null;

    private static Boolean isStart = false;

    private final static long timeStamp = 100;

    /**
     * ����һ��Ψһ��ʵ��
     *
     * @return
     */
    public static GessTimerMgr getInstance() {
        if (instance == null) {
            synchronized (GessTimerMgr.class) {
                if (instance == null) {
                    instance = new GessTimerMgr();
                }
            }
        }
        return instance;
    }

    /**
     * ��Ӷ�ʱ��
     *
     * @param key
     * @param timer
     * @param timeStamp  ���ʱ�� 100����ı���
     * @param delayStart ��ʼ�ӳ�ʱ�� 100����ı���
     */
    public void addTimer(String key, GessTimer timer, long timeStamp, long delayStart) {
        if (!isStart) {
            start();
        }
        synchronized (timerMap) {
            TimerInstance temp = new TimerInstance();
            temp.key = key;
            temp.delayStart = delayStart / timeStamp * timeStamp;
            temp.timer = timer;
            temp.timeStamp = timeStamp / timeStamp * timeStamp;
            temp.leftTime = temp.timeStamp;
            timerMap.put(key, temp);
        }
    }

    public void removeTimer(String key) {
        synchronized (timerMap) {
            timerMap.remove(key);
        }
    }

    public void start() {
        if (!isStart) {
            synchronized (isStart) {
                if (!isStart) {
                    Date date = new Date();
                    timer = new Timer();
                    timer.schedule(instance, date, timeStamp);
                    isStart = true;
                }
            }
        }

    }

    /**
     * ֹͣ��ʱ��
     */
    public void stop() {
        synchronized (timerMap) {
            timerMap.clear();
            timer.cancel();
        }

    }

    public void run() {
        synchronized (timerMap) {
            Iterator<String> iter = timerMap.keySet().iterator();
            while (iter.hasNext()) {
                TimerInstance temp = timerMap.get(iter.next());
                //��û�п�ʼ
                if (temp.delayStart > 0) {
                    temp.delayStart -= timeStamp;
                    continue;
                }
                //��ʱʱ�仹û�е�
                if (temp.leftTime > 0) {
                    temp.leftTime -= timeStamp;
                    continue;
                }
                //��ʱʱ�䵽���ó�ʱ���?��
                temp.leftTime = temp.timeStamp;
                temp.timer.onTimeOut(temp.key);
            }
        }
    }

    class TimerInstance {
        public GessTimer timer;
        public String key;
        public long timeStamp; //���ʱ�� 100����ı���
        public long delayStart;//��ʼ�ӳ�ʱ�� 100����ı���
        public long leftTime; //ʣ��ʱ��
    }

    public static void main(String[] s) throws InterruptedException {
        /*Thread.sleep(1000);
        GessTimerMgr.getInstance().removeTimer("Test");
        GessTimerMgr.getInstance().stop();*/
    }

}
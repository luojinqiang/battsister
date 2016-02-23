var provinceJSON = [{"pid": "1", "provincename": "北京"}, {"pid": "2", "provincename": "上海"}, {
    "pid": "3",
    "provincename": "天津"
}, {"pid": "4", "provincename": "重庆"}, {"pid": "5", "provincename": "黑龙江"}, {
    "pid": "6",
    "provincename": "吉林"
}, {"pid": "7", "provincename": "辽宁"}, {"pid": "8", "provincename": "河北"}, {
    "pid": "9",
    "provincename": "河南"
}, {"pid": "10", "provincename": "山东"}, {"pid": "11", "provincename": "山西"}, {
    "pid": "12",
    "provincename": "陕西"
}, {"pid": "13", "provincename": "甘肃"}, {"pid": "14", "provincename": "宁夏"}, {
    "pid": "15",
    "provincename": "江苏"
}, {"pid": "16", "provincename": "浙江"}, {"pid": "17", "provincename": "安徽"}, {
    "pid": "18",
    "provincename": "江西"
}, {"pid": "19", "provincename": "福建"}, {"pid": "20", "provincename": "湖北"}, {
    "pid": "21",
    "provincename": "湖南"
}, {"pid": "22", "provincename": "四川"}, {"pid": "23", "provincename": "广东"}, {
    "pid": "24",
    "provincename": "广西"
}, {"pid": "25", "provincename": "云南"}, {"pid": "26", "provincename": "贵州"}, {
    "pid": "27",
    "provincename": "青海"
}, {"pid": "28", "provincename": "内蒙古"}, {"pid": "29", "provincename": "新疆"}, {
    "pid": "30",
    "provincename": "西藏"
}, {"pid": "31", "provincename": "海南"}, {"pid": "32", "provincename": "香港"}, {
    "pid": "33",
    "provincename": "澳门"
}, {"pid": "53", "provincename": "台湾"}, {"pid": "54", "provincename": "海洋岛屿"}];

var cityJSON = [{"pid": "1", "cid": "1", "cityname": "北京"}, {"pid": "2", "cid": "2", "cityname": "上海"}, {
    "pid": "3",
    "cid": "3",
    "cityname": "天津"
}, {"pid": "4", "cid": "4", "cityname": "重庆"}, {"pid": "5", "cid": "5", "cityname": "哈尔滨"}, {
    "pid": "5",
    "cid": "149",
    "cityname": "齐齐哈尔"
}, {"pid": "5", "cid": "150", "cityname": "牡丹江"}, {"pid": "5", "cid": "157", "cityname": "鸡西市"}, {
    "pid": "5",
    "cid": "231",
    "cityname": "大庆市"
}, {"pid": "5", "cid": "281", "cityname": "黑河市"}, {"pid": "5", "cid": "317", "cityname": "佳木斯市"}, {
    "pid": "5",
    "cid": "517",
    "cityname": "伊春市"
}, {"pid": "5", "cid": "1128", "cityname": "绥化市"}, {"pid": "5", "cid": "1143", "cityname": "加格达奇"}, {
    "pid": "5",
    "cid": "1478",
    "cityname": "七台河市"
}, {"pid": "5", "cid": "1485", "cityname": "双鸭山市"}, {"pid": "5", "cid": "1999", "cityname": "鹤岗市"}, {
    "pid": "5",
    "cid": "22522",
    "cityname": "漠河县"
}, {"pid": "6", "cid": "158", "cityname": "长春市"}, {"pid": "6", "cid": "159", "cityname": "吉林市"}, {
    "pid": "6",
    "cid": "198",
    "cityname": "白山市"
}, {"pid": "6", "cid": "456", "cityname": "通化市"}, {"pid": "6", "cid": "523", "cityname": "延吉市"}, {
    "pid": "6",
    "cid": "1116",
    "cityname": "白城市"
}, {"pid": "6", "cid": "1220", "cityname": "四平市"}, {"pid": "6", "cid": "1303", "cityname": "松原市"}, {
    "pid": "6",
    "cid": "2798",
    "cityname": "辽源市"
}, {"pid": "6", "cid": "22589", "cityname": "长白山"}, {"pid": "7", "cid": "6", "cityname": "大连"}, {
    "pid": "7",
    "cid": "178",
    "cityname": "鞍山市"
}, {"pid": "7", "cid": "211", "cityname": "朝阳市"}, {"pid": "7", "cid": "221", "cityname": "丹东市"}, {
    "pid": "7",
    "cid": "252",
    "cityname": "抚顺市"
}, {"pid": "7", "cid": "254", "cityname": "阜新市"}, {"pid": "7", "cid": "327", "cityname": "锦州市"}, {
    "pid": "7",
    "cid": "351",
    "cityname": "辽阳市"
}, {"pid": "7", "cid": "387", "cityname": "盘锦市"}, {"pid": "7", "cid": "451", "cityname": "沈阳"}, {
    "pid": "7",
    "cid": "1048",
    "cityname": "铁岭市"
}, {"pid": "7", "cid": "1050", "cityname": "葫芦岛市"}, {"pid": "7", "cid": "1155", "cityname": "本溪市"}, {
    "pid": "7",
    "cid": "1300",
    "cityname": "营口市"
}, {"pid": "8", "cid": "147", "cityname": "秦皇岛"}, {"pid": "8", "cid": "185", "cityname": "保定市"}, {
    "pid": "8",
    "cid": "216",
    "cityname": "沧州市"
}, {"pid": "8", "cid": "275", "cityname": "邯郸市"}, {"pid": "8", "cid": "290", "cityname": "衡水市"}, {
    "pid": "8",
    "cid": "340",
    "cityname": "廊坊市"
}, {"pid": "8", "cid": "428", "cityname": "石家庄"}, {"pid": "8", "cid": "468", "cityname": "唐山市"}, {
    "pid": "8",
    "cid": "550",
    "cityname": "张家口市"
}, {"pid": "8", "cid": "562", "cityname": "承德市"}, {"pid": "8", "cid": "947", "cityname": "邢台市"}, {
    "pid": "8",
    "cid": "22566",
    "cityname": "武安市"
}, {"pid": "9", "cid": "181", "cityname": "安阳市"}, {"pid": "9", "cid": "331", "cityname": "开封市"}, {
    "pid": "9",
    "cid": "350",
    "cityname": "洛阳市"
}, {"pid": "9", "cid": "385", "cityname": "南阳市"}, {"pid": "9", "cid": "386", "cityname": "平顶山市"}, {
    "pid": "9",
    "cid": "436",
    "cityname": "三门峡市"
}, {"pid": "9", "cid": "441", "cityname": "商丘市"}, {"pid": "9", "cid": "507", "cityname": "新乡市"}, {
    "pid": "9",
    "cid": "510",
    "cityname": "信阳市"
}, {"pid": "9", "cid": "551", "cityname": "驻马店市"}, {"pid": "9", "cid": "559", "cityname": "郑州"}, {
    "pid": "9",
    "cid": "951",
    "cityname": "鹤壁市"
}, {"pid": "9", "cid": "1088", "cityname": "漯河市"}, {"pid": "9", "cid": "1093", "cityname": "焦作市"}, {
    "pid": "9",
    "cid": "1094",
    "cityname": "许昌市"
}, {"pid": "9", "cid": "1232", "cityname": "濮阳市"}, {"pid": "9", "cid": "1545", "cityname": "周口市"}, {
    "pid": "10",
    "cid": "7",
    "cityname": "青岛"
}, {"pid": "10", "cid": "144", "cityname": "济南"}, {"pid": "10", "cid": "236", "cityname": "东营市"}, {
    "pid": "10",
    "cid": "318",
    "cityname": "济宁市"
}, {"pid": "10", "cid": "454", "cityname": "泰安市"}, {"pid": "10", "cid": "475", "cityname": "潍坊市"}, {
    "pid": "10",
    "cid": "479",
    "cityname": "威海"
}, {"pid": "10", "cid": "533", "cityname": "烟台市"}, {"pid": "10", "cid": "542", "cityname": "淄博市"}, {
    "pid": "10",
    "cid": "569",
    "cityname": "临沂市"
}, {"pid": "10", "cid": "614", "cityname": "枣庄市"}, {"pid": "10", "cid": "1071", "cityname": "聊城市"}, {
    "pid": "10",
    "cid": "1074",
    "cityname": "菏泽市"
}, {"pid": "10", "cid": "1106", "cityname": "日照市"}, {"pid": "10", "cid": "1370", "cityname": "德州市"}, {
    "pid": "10",
    "cid": "2904",
    "cityname": "滨州市"
}, {"pid": "10", "cid": "2997", "cityname": "莱芜市"}, {"pid": "11", "cid": "105", "cityname": "太原"}, {
    "pid": "11",
    "cid": "136",
    "cityname": "大同市"
}, {"pid": "11", "cid": "137", "cityname": "长治市"}, {"pid": "11", "cid": "139", "cityname": "临汾市"}, {
    "pid": "11",
    "cid": "140",
    "cityname": "运城市"
}, {"pid": "11", "cid": "513", "cityname": "忻州市"}, {"pid": "11", "cid": "907", "cityname": "阳泉市"}, {
    "pid": "11",
    "cid": "1092",
    "cityname": "晋城市"
}, {"pid": "11", "cid": "1317", "cityname": "朔州市"}, {"pid": "11", "cid": "1453", "cityname": "晋中市"}, {
    "pid": "11",
    "cid": "2914",
    "cityname": "吕梁市"
}, {"pid": "12", "cid": "10", "cityname": "西安"}, {"pid": "12", "cid": "110", "cityname": "延安"}, {
    "pid": "12",
    "cid": "111",
    "cityname": "咸阳"
}, {"pid": "12", "cid": "112", "cityname": "宝鸡"}, {"pid": "12", "cid": "118", "cityname": "铜川"}, {
    "pid": "12",
    "cid": "129",
    "cityname": "汉中市"
}, {"pid": "12", "cid": "171", "cityname": "安康市"}, {"pid": "12", "cid": "527", "cityname": "榆林市"}, {
    "pid": "12",
    "cid": "1030",
    "cityname": "渭南市"
}, {"pid": "12", "cid": "2973", "cityname": "商洛市"}, {"pid": "13", "cid": "100", "cityname": "兰州"}, {
    "pid": "13",
    "cid": "326",
    "cityname": "嘉峪关"
}, {"pid": "13", "cid": "388", "cityname": "平凉市"}, {"pid": "13", "cid": "404", "cityname": "庆阳市"}, {
    "pid": "13",
    "cid": "464",
    "cityname": "天水市"
}, {"pid": "13", "cid": "662", "cityname": "酒泉市"}, {"pid": "13", "cid": "663", "cityname": "张掖市"}, {
    "pid": "13",
    "cid": "664",
    "cityname": "武威市"
}, {"pid": "13", "cid": "1021", "cityname": "定西市"}, {"pid": "13", "cid": "1158", "cityname": "金昌市"}, {
    "pid": "13",
    "cid": "1570",
    "cityname": "合作市"
}, {"pid": "13", "cid": "1808", "cityname": "白银市"}, {"pid": "13", "cid": "1810", "cityname": "临夏市"}, {
    "pid": "13",
    "cid": "1948",
    "cityname": "陇南市"
}, {"pid": "14", "cid": "99", "cityname": "银川"}, {"pid": "14", "cid": "321", "cityname": "固原市"}, {
    "pid": "14",
    "cid": "556",
    "cityname": "中卫市"
}, {"pid": "14", "cid": "1134", "cityname": "石嘴山市"}, {"pid": "14", "cid": "1644", "cityname": "吴忠市"}, {
    "pid": "15",
    "cid": "12",
    "cityname": "南京"
}, {"pid": "15", "cid": "13", "cityname": "无锡"}, {"pid": "15", "cid": "14", "cityname": "苏州"}, {
    "pid": "15",
    "cid": "15",
    "cityname": "扬州"
}, {"pid": "15", "cid": "16", "cityname": "镇江"}, {"pid": "15", "cid": "82", "cityname": "南通"}, {
    "pid": "15",
    "cid": "96",
    "cityname": "常熟"
}, {"pid": "15", "cid": "213", "cityname": "常州市"}, {"pid": "15", "cid": "353", "cityname": "连云港"}, {
    "pid": "15",
    "cid": "512",
    "cityname": "徐州市"
}, {"pid": "15", "cid": "577", "cityname": "淮安市"}, {"pid": "15", "cid": "579", "cityname": "泰州市"}, {
    "pid": "15",
    "cid": "1200",
    "cityname": "盐城市"
}, {"pid": "15", "cid": "1869", "cityname": "宿迁市"}, {"pid": "15", "cid": "22467", "cityname": "江阴"}, {
    "pid": "15",
    "cid": "22468",
    "cityname": "澄江"
}, {"pid": "15", "cid": "22598", "cityname": "昆山市"}, {"pid": "16", "cid": "17", "cityname": "杭州"}, {
    "pid": "16",
    "cid": "19",
    "cityname": "舟山"
}, {"pid": "16", "cid": "22", "cityname": "绍兴"}, {"pid": "16", "cid": "86", "cityname": "湖州"}, {
    "pid": "16",
    "cid": "308",
    "cityname": "金华市"
}, {"pid": "16", "cid": "346", "cityname": "丽水"}, {"pid": "16", "cid": "375", "cityname": "宁波"}, {
    "pid": "16",
    "cid": "407",
    "cityname": "衢州市"
}, {"pid": "16", "cid": "491", "cityname": "温州市"}, {"pid": "16", "cid": "571", "cityname": "嘉兴市"}, {
    "pid": "16",
    "cid": "578",
    "cityname": "台州市"
}, {"pid": "16", "cid": "22572", "cityname": "桐乡市"}, {"pid": "17", "cid": "23", "cityname": "黄山"}, {
    "pid": "17",
    "cid": "177",
    "cityname": "安庆"
}, {"pid": "17", "cid": "182", "cityname": "蚌埠"}, {"pid": "17", "cid": "214", "cityname": "滁州市"}, {
    "pid": "17",
    "cid": "218",
    "cityname": "池州市"
}, {"pid": "17", "cid": "257", "cityname": "阜阳"}, {"pid": "17", "cid": "272", "cityname": "淮北"}, {
    "pid": "17",
    "cid": "278",
    "cityname": "合肥"
}, {"pid": "17", "cid": "459", "cityname": "铜陵"}, {"pid": "17", "cid": "478", "cityname": "芜湖"}, {
    "pid": "17",
    "cid": "521",
    "cityname": "宿州市"
}, {"pid": "17", "cid": "589", "cityname": "巢湖"}, {"pid": "17", "cid": "1006", "cityname": "宣城"}, {
    "pid": "17",
    "cid": "1024",
    "cityname": "马鞍山"
}, {"pid": "17", "cid": "1078", "cityname": "亳州"}, {"pid": "17", "cid": "1452", "cityname": "淮南"}, {
    "pid": "17",
    "cid": "1870",
    "cityname": "六安市"
}, {"pid": "18", "cid": "24", "cityname": "九江"}, {"pid": "18", "cid": "268", "cityname": "赣州市"}, {
    "pid": "18",
    "cid": "305",
    "cityname": "景德镇市"
}, {"pid": "18", "cid": "376", "cityname": "南昌"}, {"pid": "18", "cid": "395", "cityname": "萍乡市"}, {
    "pid": "18",
    "cid": "411",
    "cityname": "上饶市"
}, {"pid": "18", "cid": "518", "cityname": "宜春市"}, {"pid": "18", "cid": "534", "cityname": "鹰潭市"}, {
    "pid": "18",
    "cid": "603",
    "cityname": "新余市"
}, {"pid": "18", "cid": "933", "cityname": "吉安市"}, {"pid": "18", "cid": "2811", "cityname": "抚州市"}, {
    "pid": "18",
    "cid": "22523",
    "cityname": "井冈山市"
}, {"pid": "19", "cid": "25", "cityname": "厦门"}, {"pid": "19", "cid": "258", "cityname": "福州"}, {
    "pid": "19",
    "cid": "348",
    "cityname": "龙岩市"
}, {"pid": "19", "cid": "378", "cityname": "宁德市"}, {"pid": "19", "cid": "406", "cityname": "泉州"}, {
    "pid": "19",
    "cid": "437",
    "cityname": "三明"
}, {"pid": "19", "cid": "560", "cityname": "漳州"}, {"pid": "19", "cid": "606", "cityname": "南平"}, {
    "pid": "19",
    "cid": "667",
    "cityname": "莆田"
}, {"pid": "20", "cid": "245", "cityname": "恩施市"}, {"pid": "20", "cid": "280", "cityname": "黄冈市"}, {
    "pid": "20",
    "cid": "292",
    "cityname": "黄石市"
}, {"pid": "20", "cid": "328", "cityname": "荆州市"}, {"pid": "20", "cid": "452", "cityname": "十堰市"}, {
    "pid": "20",
    "cid": "477",
    "cityname": "武汉"
}, {"pid": "20", "cid": "496", "cityname": "襄阳市"}, {"pid": "20", "cid": "515", "cityname": "宜昌市"}, {
    "pid": "20",
    "cid": "657",
    "cityname": "神农架林区"
}, {"pid": "20", "cid": "937", "cityname": "咸宁市"}, {"pid": "20", "cid": "992", "cityname": "鄂州市"}, {
    "pid": "20",
    "cid": "1117",
    "cityname": "随州市"
}, {"pid": "20", "cid": "1121", "cityname": "荆门市"}, {"pid": "20", "cid": "1479", "cityname": "孝感市"}, {
    "pid": "20",
    "cid": "2549",
    "cityname": "仙桃市"
}, {"pid": "20", "cid": "2550", "cityname": "天门市"}, {"pid": "20", "cid": "2551", "cityname": "潜江市"}, {
    "pid": "21",
    "cid": "27",
    "cityname": "张家界"
}, {"pid": "21", "cid": "201", "cityname": "常德市"}, {"pid": "21", "cid": "206", "cityname": "长沙"}, {
    "pid": "21",
    "cid": "282",
    "cityname": "怀化市"
}, {"pid": "21", "cid": "297", "cityname": "衡阳市"}, {"pid": "21", "cid": "539", "cityname": "岳阳市"}, {
    "pid": "21",
    "cid": "598",
    "cityname": "湘潭市"
}, {"pid": "21", "cid": "601", "cityname": "株洲市"}, {"pid": "21", "cid": "612", "cityname": "郴州市"}, {
    "pid": "21",
    "cid": "918",
    "cityname": "娄底市"
}, {"pid": "21", "cid": "970", "cityname": "永州市"}, {"pid": "21", "cid": "1110", "cityname": "吉首市"}, {
    "pid": "21",
    "cid": "1111",
    "cityname": "邵阳市"
}, {"pid": "21", "cid": "1125", "cityname": "益阳市"}, {"pid": "22", "cid": "28", "cityname": "成都"}, {
    "pid": "22",
    "cid": "234",
    "cityname": "达州市"
}, {"pid": "22", "cid": "237", "cityname": "德阳市"}, {"pid": "22", "cid": "267", "cityname": "广元市"}, {
    "pid": "22",
    "cid": "345",
    "cityname": "乐山"
}, {"pid": "22", "cid": "355", "cityname": "泸州市"}, {"pid": "22", "cid": "370", "cityname": "绵阳市"}, {
    "pid": "22",
    "cid": "377",
    "cityname": "南充市"
}, {"pid": "22", "cid": "494", "cityname": "西昌市"}, {"pid": "22", "cid": "514", "cityname": "宜宾市"}, {
    "pid": "22",
    "cid": "544",
    "cityname": "自贡市"
}, {"pid": "22", "cid": "1011", "cityname": "内江市"}, {"pid": "22", "cid": "1097", "cityname": "攀枝花"}, {
    "pid": "22",
    "cid": "1100",
    "cityname": "广安市"
}, {"pid": "22", "cid": "1148", "cityname": "眉山市"}, {"pid": "22", "cid": "1371", "cityname": "遂宁市"}, {
    "pid": "22",
    "cid": "1532",
    "cityname": "康定"
}, {"pid": "22", "cid": "2152", "cityname": "马尔康县"}, {"pid": "22", "cid": "2223", "cityname": "雅安市"}, {
    "pid": "22",
    "cid": "2224",
    "cityname": "巴中市"
}, {"pid": "22", "cid": "2228", "cityname": "资阳市"}, {"pid": "22", "cid": "22508", "cityname": "甘孜州"}, {
    "pid": "22",
    "cid": "22509",
    "cityname": "泸定县"
}, {"pid": "22", "cid": "22511", "cityname": "高新区"}, {"pid": "22", "cid": "22563", "cityname": "阿坝州 "}, {
    "pid": "23",
    "cid": "30",
    "cityname": "深圳"
}, {"pid": "23", "cid": "31", "cityname": "珠海"}, {"pid": "23", "cid": "32", "cityname": "广州"}, {
    "pid": "23",
    "cid": "215",
    "cityname": "潮州市"
}, {"pid": "23", "cid": "223", "cityname": "东莞市"}, {"pid": "23", "cid": "251", "cityname": "佛山市"}, {
    "pid": "23",
    "cid": "299",
    "cityname": "惠州"
}, {"pid": "23", "cid": "316", "cityname": "江门市"}, {"pid": "23", "cid": "368", "cityname": "梅州市"}, {
    "pid": "23",
    "cid": "422",
    "cityname": "韶关市"
}, {"pid": "23", "cid": "447", "cityname": "汕头市"}, {"pid": "23", "cid": "547", "cityname": "湛江市"}, {
    "pid": "23",
    "cid": "552",
    "cityname": "肇庆市"
}, {"pid": "23", "cid": "553", "cityname": "中山市"}, {"pid": "23", "cid": "692", "cityname": "阳江市"}, {
    "pid": "23",
    "cid": "693",
    "cityname": "河源市"
}, {"pid": "23", "cid": "956", "cityname": "揭阳市"}, {"pid": "23", "cid": "1105", "cityname": "茂名"}, {
    "pid": "23",
    "cid": "1422",
    "cityname": "清远市"
}, {"pid": "23", "cid": "1436", "cityname": "汕尾市"}, {"pid": "23", "cid": "2036", "cityname": "云浮市"}, {
    "pid": "23",
    "cid": "22517",
    "cityname": "鹤山市"
}, {"pid": "24", "cid": "33", "cityname": "桂林"}, {"pid": "24", "cid": "189", "cityname": "北海市"}, {
    "pid": "24",
    "cid": "354",
    "cityname": "柳州市"
}, {"pid": "24", "cid": "380", "cityname": "南宁"}, {"pid": "24", "cid": "492", "cityname": "梧州市"}, {
    "pid": "24",
    "cid": "1113",
    "cityname": "玉林市"
}, {"pid": "24", "cid": "1140", "cityname": "百色市"}, {"pid": "24", "cid": "1531", "cityname": "崇左市"}, {
    "pid": "24",
    "cid": "2082",
    "cityname": "河池市"
}, {"pid": "24", "cid": "2110", "cityname": "防城港市"}, {"pid": "24", "cid": "2113", "cityname": "钦州市"}, {
    "pid": "24",
    "cid": "2116",
    "cityname": "贵港市"
}, {"pid": "24", "cid": "2132", "cityname": "贺州市"}, {"pid": "24", "cid": "2146", "cityname": "来宾市"}, {
    "pid": "25",
    "cid": "34",
    "cityname": "昆明"
}, {"pid": "25", "cid": "35", "cityname": "西双版纳"}, {"pid": "25", "cid": "36", "cityname": "大理"}, {
    "pid": "25",
    "cid": "37",
    "cityname": "丽江"
}, {"pid": "25", "cid": "93", "cityname": "迪庆州"}, {"pid": "25", "cid": "186", "cityname": "玉溪市"}, {
    "pid": "25",
    "cid": "197",
    "cityname": "保山市"
}, {"pid": "25", "cid": "365", "cityname": "德宏州"}, {"pid": "25", "cid": "435", "cityname": "思茅市"}, {
    "pid": "25",
    "cid": "555",
    "cityname": "昭通市"
}, {"pid": "25", "cid": "985", "cityname": "曲靖市"}, {"pid": "25", "cid": "1236", "cityname": "临沧市"}, {
    "pid": "25",
    "cid": "1341",
    "cityname": "红河州"
}, {"pid": "25", "cid": "1342", "cityname": "文山州"}, {"pid": "25", "cid": "2974", "cityname": "怒江傈傈族自治州"}, {
    "pid": "25",
    "cid": "2982",
    "cityname": "楚雄彝族自治州"
}, {"pid": "26", "cid": "38", "cityname": "贵阳"}, {"pid": "26", "cid": "179", "cityname": "安顺市"}, {
    "pid": "26",
    "cid": "333",
    "cityname": "凯里市"
}, {"pid": "26", "cid": "558", "cityname": "遵义市"}, {"pid": "26", "cid": "605", "cityname": "六盘水市"}, {
    "pid": "26",
    "cid": "975",
    "cityname": "都匀市"
}, {"pid": "26", "cid": "1139", "cityname": "兴义市"}, {"pid": "26", "cid": "1227", "cityname": "铜仁市"}, {
    "pid": "26",
    "cid": "2285",
    "cityname": "毕节市"
}, {"pid": "27", "cid": "124", "cityname": "西宁"}, {"pid": "27", "cid": "371", "cityname": "海晏县"}, {
    "pid": "27",
    "cid": "1020",
    "cityname": "平安县"
}, {"pid": "27", "cid": "1508", "cityname": "德令哈市"}, {"pid": "27", "cid": "1651", "cityname": "玉树县"}, {
    "pid": "27",
    "cid": "1659",
    "cityname": "玛沁县"
}, {"pid": "27", "cid": "1669", "cityname": "同仁县"}, {"pid": "27", "cid": "3882", "cityname": "共和县"}, {
    "pid": "27",
    "cid": "22556",
    "cityname": "祁连县"
}, {"pid": "28", "cid": "103", "cityname": "呼和浩特"}, {"pid": "28", "cid": "141", "cityname": "包头市"}, {
    "pid": "28",
    "cid": "142",
    "cityname": "海拉尔"
}, {"pid": "28", "cid": "202", "cityname": "赤峰市"}, {"pid": "28", "cid": "458", "cityname": "通辽市"}, {
    "pid": "28",
    "cid": "484",
    "cityname": "乌兰浩特市"
}, {"pid": "28", "cid": "500", "cityname": "锡林浩特市"}, {"pid": "28", "cid": "1133", "cityname": "乌海市"}, {
    "pid": "28",
    "cid": "1368",
    "cityname": "鄂尔多斯市"
}, {"pid": "28", "cid": "2706", "cityname": "乌兰察布市"}, {"pid": "28", "cid": "2742", "cityname": "临河市"}, {
    "pid": "28",
    "cid": "2768",
    "cityname": "巴彦浩特市"
}, {"pid": "28", "cid": "22469", "cityname": "兴安盟"}, {"pid": "28", "cid": "22611", "cityname": "阿拉善盟"}, {
    "pid": "29",
    "cid": "39",
    "cityname": "乌鲁木齐"
}, {"pid": "29", "cid": "40", "cityname": "吐鲁番"}, {"pid": "29", "cid": "98", "cityname": "伊犁州"}, {
    "pid": "29",
    "cid": "109",
    "cityname": "喀什"
}, {"pid": "29", "cid": "166", "cityname": "克拉玛依市"}, {"pid": "29", "cid": "173", "cityname": "阿克苏市"}, {
    "pid": "29",
    "cid": "175",
    "cityname": "阿勒泰"
}, {"pid": "29", "cid": "285", "cityname": "哈密"}, {"pid": "29", "cid": "294", "cityname": "和田市"}, {
    "pid": "29",
    "cid": "330",
    "cityname": "库尔勒市"
}, {"pid": "29", "cid": "455", "cityname": "塔城市"}, {"pid": "29", "cid": "1519", "cityname": "昌吉市"}, {
    "pid": "29",
    "cid": "1694",
    "cityname": "阿图什市"
}, {"pid": "29", "cid": "2949", "cityname": "博乐市"}, {"pid": "29", "cid": "22466", "cityname": "依克苏市"}, {
    "pid": "30",
    "cid": "41",
    "cityname": "拉萨"
}, {"pid": "30", "cid": "92", "cityname": "日喀则"}, {"pid": "30", "cid": "97", "cityname": "阿里"}, {
    "pid": "30",
    "cid": "108",
    "cityname": "林芝地区"
}, {"pid": "30", "cid": "439", "cityname": "山南地区"}, {"pid": "30", "cid": "575", "cityname": "昌都地区"}, {
    "pid": "30",
    "cid": "1470",
    "cityname": "那曲地区"
}, {"pid": "30", "cid": "22506", "cityname": "日喀则市"}, {"pid": "31", "cid": "42", "cityname": "海口"}, {
    "pid": "31",
    "cid": "43",
    "cityname": "三亚"
}, {"pid": "31", "cid": "2321", "cityname": "省直辖"}, {"pid": "31", "cid": "22510", "cityname": "三亚湾度假区"}, {
    "pid": "31",
    "cid": "22562",
    "cityname": "万宁"
}, {"pid": "32", "cid": "18", "cityname": "香港"}, {"pid": "33", "cid": "59", "cityname": "澳门"}, {
    "pid": "33",
    "cid": "22507",
    "cityname": "澳门"
}, {"pid": "53", "cid": "617", "cityname": "台北"}, {"pid": "54", "cid": "3884", "cityname": "中国海洋"}, {
    "pid": "54",
    "cid": "3889",
    "cityname": "海峡"
}, {"pid": "54", "cid": "3892", "cityname": "海湾"}];

var quyuJSON = [{"pid": "1", "cid": "1", "quid": "1098", "cityname": "怀柔区"}, {
    "pid": "1",
    "cid": "1",
    "quid": "1138",
    "cityname": "延庆县"
}, {"pid": "1", "cid": "1", "quid": "1638", "cityname": "密云县"}, {
    "pid": "1",
    "cid": "1",
    "quid": "3028",
    "cityname": "通州区"
}, {"pid": "1", "cid": "1", "quid": "9824", "cityname": "东城区"}, {
    "pid": "1",
    "cid": "1",
    "quid": "9825",
    "cityname": "西城区"
}, {"pid": "1", "cid": "1", "quid": "9828", "cityname": "朝阳区"}, {
    "pid": "1",
    "cid": "1",
    "quid": "9829",
    "cityname": "海淀区"
}, {"pid": "1", "cid": "1", "quid": "9830", "cityname": "丰台区"}, {
    "pid": "1",
    "cid": "1",
    "quid": "9831",
    "cityname": "石景山区"
}, {"pid": "1", "cid": "1", "quid": "9832", "cityname": "门头沟区"}, {
    "pid": "1",
    "cid": "1",
    "quid": "9833",
    "cityname": "房山区"
}, {"pid": "1", "cid": "1", "quid": "9835", "cityname": "顺义区"}, {
    "pid": "1",
    "cid": "1",
    "quid": "9836",
    "cityname": "昌平区"
}, {"pid": "1", "cid": "1", "quid": "9837", "cityname": "大兴区"}, {
    "pid": "1",
    "cid": "1",
    "quid": "9839",
    "cityname": "平谷区"
}, {"pid": "2", "cid": "2", "quid": "1230", "cityname": "崇明县"}, {
    "pid": "2",
    "cid": "2",
    "quid": "9809",
    "cityname": "虹口区"
}, {"pid": "2", "cid": "2", "quid": "9810", "cityname": "长宁区"}, {
    "pid": "2",
    "cid": "2",
    "quid": "9811",
    "cityname": "浦东新区"
}, {"pid": "2", "cid": "2", "quid": "9813", "cityname": "杨浦区"}, {
    "pid": "2",
    "cid": "2",
    "quid": "9814",
    "cityname": "黄浦区"
}, {"pid": "2", "cid": "2", "quid": "9815", "cityname": "徐汇区"}, {
    "pid": "2",
    "cid": "2",
    "quid": "9816",
    "cityname": "静安区"
}, {"pid": "2", "cid": "2", "quid": "9817", "cityname": "嘉定区"}, {
    "pid": "2",
    "cid": "2",
    "quid": "9818",
    "cityname": "奉贤区"
}, {"pid": "2", "cid": "2", "quid": "9819", "cityname": "金山区"}, {
    "pid": "2",
    "cid": "2",
    "quid": "9820",
    "cityname": "松江区"
}, {"pid": "2", "cid": "2", "quid": "9821", "cityname": "闵行区"}, {
    "pid": "2",
    "cid": "2",
    "quid": "9822",
    "cityname": "青浦区"
}, {"pid": "2", "cid": "2", "quid": "9823", "cityname": "普陀区"}, {
    "pid": "2",
    "cid": "2",
    "quid": "10652",
    "cityname": "宝山区"
}, {"pid": "2", "cid": "2", "quid": "12015", "cityname": "闸北区"}, {
    "pid": "3",
    "cid": "3",
    "quid": "885",
    "cityname": "静海"
}, {"pid": "3", "cid": "3", "quid": "965", "cityname": "塘沽"}, {
    "pid": "3",
    "cid": "3",
    "quid": "1636",
    "cityname": "蓟县"
}, {"pid": "3", "cid": "3", "quid": "1637", "cityname": "宁河县"}, {
    "pid": "3",
    "cid": "3",
    "quid": "9938",
    "cityname": "和平区"
}, {"pid": "3", "cid": "3", "quid": "9939", "cityname": "河东区"}, {
    "pid": "3",
    "cid": "3",
    "quid": "9940",
    "cityname": "河西区"
}, {"pid": "3", "cid": "3", "quid": "9941", "cityname": "南开区"}, {
    "pid": "3",
    "cid": "3",
    "quid": "9942",
    "cityname": "河北区"
}, {"pid": "3", "cid": "3", "quid": "9943", "cityname": "红桥区"}, {
    "pid": "3",
    "cid": "3",
    "quid": "9944",
    "cityname": "塘沽区"
}, {"pid": "3", "cid": "3", "quid": "9945", "cityname": "汉沽区"}, {
    "pid": "3",
    "cid": "3",
    "quid": "9946",
    "cityname": "大港区"
}, {"pid": "3", "cid": "3", "quid": "9947", "cityname": "东丽区"}, {
    "pid": "3",
    "cid": "3",
    "quid": "9948",
    "cityname": "西青区"
}, {"pid": "3", "cid": "3", "quid": "9949", "cityname": "北辰区"}, {
    "pid": "3",
    "cid": "3",
    "quid": "9950",
    "cityname": "津南区"
}, {"pid": "3", "cid": "3", "quid": "9951", "cityname": "武清区"}, {
    "pid": "3",
    "cid": "3",
    "quid": "9952",
    "cityname": "宝坻区"
}, {"pid": "4", "cid": "4", "quid": "247", "cityname": "丰都县"}, {
    "pid": "4",
    "cid": "4",
    "quid": "249",
    "cityname": "涪陵区"
}, {"pid": "4", "cid": "4", "quid": "427", "cityname": "梁平县"}, {
    "pid": "4",
    "cid": "4",
    "quid": "487",
    "cityname": "万州区"
}, {"pid": "4", "cid": "4", "quid": "516", "cityname": "永川区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "988",
    "cityname": "綦江区"
}, {"pid": "4", "cid": "4", "quid": "1160", "cityname": "北碚区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1467",
    "cityname": "城口县"
}, {"pid": "4", "cid": "4", "quid": "1468", "cityname": "荣昌县"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1474",
    "cityname": "忠县"
}, {"pid": "4", "cid": "4", "quid": "1615", "cityname": "巫溪县"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1616",
    "cityname": "奉节县"
}, {"pid": "4", "cid": "4", "quid": "1617", "cityname": "巫山县"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1618",
    "cityname": "云阳县"
}, {"pid": "4", "cid": "4", "quid": "1619", "cityname": "垫江县"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1620",
    "cityname": "石柱土家族自治县"
}, {"pid": "4", "cid": "4", "quid": "1621", "cityname": "长寿区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1622",
    "cityname": "武隆县"
}, {"pid": "4", "cid": "4", "quid": "1623", "cityname": "彭水苗族土家族自治县"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1624",
    "cityname": "酉阳土家族苗族自治县"
}, {"pid": "4", "cid": "4", "quid": "1625", "cityname": "秀山土家族苗族自治县"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1626",
    "cityname": "南川区"
}, {"pid": "4", "cid": "4", "quid": "1627", "cityname": "黔江区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1628",
    "cityname": "开县"
}, {"pid": "4", "cid": "4", "quid": "1629", "cityname": "合川区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1630",
    "cityname": "潼南县"
}, {"pid": "4", "cid": "4", "quid": "1631", "cityname": "大足县"}, {
    "pid": "4",
    "cid": "4",
    "quid": "1632",
    "cityname": "铜梁县"
}, {"pid": "4", "cid": "4", "quid": "1635", "cityname": "江津区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "2999",
    "cityname": "璧山县"
}, {"pid": "4", "cid": "4", "quid": "9840", "cityname": "渝中区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "9841",
    "cityname": "大渡口区"
}, {"pid": "4", "cid": "4", "quid": "9842", "cityname": "江北区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "9843",
    "cityname": "沙坪坝区"
}, {"pid": "4", "cid": "4", "quid": "9844", "cityname": "九龙坡区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "9845",
    "cityname": "南岸区"
}, {"pid": "4", "cid": "4", "quid": "9846", "cityname": "双桥区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "9847",
    "cityname": "渝北区"
}, {"pid": "4", "cid": "4", "quid": "12017", "cityname": "巴南区"}, {
    "pid": "4",
    "cid": "4",
    "quid": "22571",
    "cityname": "高新区"
}, {"pid": "5", "cid": "281", "quid": "153", "cityname": "北安市"}, {
    "pid": "5",
    "cid": "1143",
    "quid": "155",
    "cityname": "漠河县"
}, {"pid": "5", "cid": "157", "quid": "156", "cityname": "虎林市"}, {
    "pid": "5",
    "cid": "5",
    "quid": "416",
    "cityname": "双城市"
}, {"pid": "5", "cid": "150", "quid": "421", "cityname": "绥芬河市"}, {
    "pid": "5",
    "cid": "5",
    "quid": "528",
    "cityname": "依兰县"
}, {"pid": "5", "cid": "231", "quid": "611", "cityname": "杜尔伯特"}, {
    "pid": "5",
    "cid": "149",
    "quid": "1127",
    "cityname": "泰来县"
}, {"pid": "5", "cid": "1128", "quid": "1130", "cityname": "安达市"}, {
    "pid": "5",
    "cid": "281",
    "quid": "1142",
    "cityname": "嫩江县"
}, {"pid": "5", "cid": "5", "quid": "1984", "cityname": "方正县"}, {
    "pid": "5",
    "cid": "5",
    "quid": "1985",
    "cityname": "宾县"
}, {"pid": "5", "cid": "5", "quid": "1986", "cityname": "巴彦县"}, {
    "pid": "5",
    "cid": "5",
    "quid": "1987",
    "cityname": "通河县"
}, {"pid": "5", "cid": "5", "quid": "1988", "cityname": "木兰县"}, {
    "pid": "5",
    "cid": "5",
    "quid": "1989",
    "cityname": "延寿县"
}, {"pid": "5", "cid": "149", "quid": "1990", "cityname": "富裕县"}, {
    "pid": "5",
    "cid": "149",
    "quid": "1991",
    "cityname": "拜泉县"
}, {"pid": "5", "cid": "149", "quid": "1992", "cityname": "甘南县"}, {
    "pid": "5",
    "cid": "149",
    "quid": "1993",
    "cityname": "依安县"
}, {"pid": "5", "cid": "149", "quid": "1994", "cityname": "克山县"}, {
    "pid": "5",
    "cid": "149",
    "quid": "1995",
    "cityname": "克东县"
}, {"pid": "5", "cid": "149", "quid": "1996", "cityname": "龙江县"}, {
    "pid": "5",
    "cid": "1999",
    "quid": "1997",
    "cityname": "萝北县"
}, {"pid": "5", "cid": "1999", "quid": "1998", "cityname": "绥滨县"}, {
    "pid": "5",
    "cid": "1485",
    "quid": "2000",
    "cityname": "集贤县"
}, {"pid": "5", "cid": "1485", "quid": "2001", "cityname": "宝清县"}, {
    "pid": "5",
    "cid": "1485",
    "quid": "2002",
    "cityname": "友谊县"
}, {"pid": "5", "cid": "1485", "quid": "2003", "cityname": "饶河县"}, {
    "pid": "5",
    "cid": "157",
    "quid": "2004",
    "cityname": "密山市"
}, {"pid": "5", "cid": "157", "quid": "2005", "cityname": "鸡东县"}, {
    "pid": "5",
    "cid": "231",
    "quid": "2006",
    "cityname": "林甸县"
}, {"pid": "5", "cid": "231", "quid": "2007", "cityname": "肇州县"}, {
    "pid": "5",
    "cid": "231",
    "quid": "2008",
    "cityname": "肇源县"
}, {"pid": "5", "cid": "517", "quid": "2009", "cityname": "铁力市"}, {
    "pid": "5",
    "cid": "517",
    "quid": "2010",
    "cityname": "嘉荫县"
}, {"pid": "5", "cid": "150", "quid": "2011", "cityname": "宁安市"}, {
    "pid": "5",
    "cid": "150",
    "quid": "2012",
    "cityname": "海林市"
}, {"pid": "5", "cid": "150", "quid": "2013", "cityname": "穆棱市"}, {
    "pid": "5",
    "cid": "150",
    "quid": "2014",
    "cityname": "林口县"
}, {"pid": "5", "cid": "150", "quid": "2015", "cityname": "东宁县"}, {
    "pid": "5",
    "cid": "317",
    "quid": "2016",
    "cityname": "同江市"
}, {"pid": "5", "cid": "317", "quid": "2017", "cityname": "富锦市"}, {
    "pid": "5",
    "cid": "317",
    "quid": "2018",
    "cityname": "桦川县"
}, {"pid": "5", "cid": "317", "quid": "2019", "cityname": "抚远县"}, {
    "pid": "5",
    "cid": "317",
    "quid": "2020",
    "cityname": "桦南县"
}, {"pid": "5", "cid": "317", "quid": "2021", "cityname": "汤原县"}, {
    "pid": "5",
    "cid": "1478",
    "quid": "2022",
    "cityname": "勃利县"
}, {"pid": "5", "cid": "281", "quid": "2023", "cityname": "五大连池市"}, {
    "pid": "5",
    "cid": "281",
    "quid": "2024",
    "cityname": "逊克县"
}, {"pid": "5", "cid": "281", "quid": "2025", "cityname": "孙吴县"}, {
    "pid": "5",
    "cid": "1128",
    "quid": "2026",
    "cityname": "肇东市"
}, {"pid": "5", "cid": "1128", "quid": "2027", "cityname": "海伦市"}, {
    "pid": "5",
    "cid": "1128",
    "quid": "2028",
    "cityname": "绥棱县"
}, {"pid": "5", "cid": "1128", "quid": "2029", "cityname": "兰西县"}, {
    "pid": "5",
    "cid": "1128",
    "quid": "2030",
    "cityname": "明水县"
}, {"pid": "5", "cid": "1128", "quid": "2031", "cityname": "青冈县"}, {
    "pid": "5",
    "cid": "1128",
    "quid": "2032",
    "cityname": "庆安县"
}, {"pid": "5", "cid": "1128", "quid": "2033", "cityname": "望奎县"}, {
    "pid": "5",
    "cid": "1143",
    "quid": "2034",
    "cityname": "呼玛县"
}, {"pid": "5", "cid": "1143", "quid": "2035", "cityname": "塔河县"}, {
    "pid": "5",
    "cid": "5",
    "quid": "2431",
    "cityname": "阿城市"
}, {"pid": "5", "cid": "5", "quid": "2432", "cityname": "尚志市"}, {
    "pid": "5",
    "cid": "5",
    "quid": "2433",
    "cityname": "五常市"
}, {"pid": "5", "cid": "5", "quid": "3026", "cityname": "呼兰县"}, {
    "pid": "5",
    "cid": "149",
    "quid": "3027",
    "cityname": "讷河市"
}, {"pid": "5", "cid": "5", "quid": "10399", "cityname": "松北区"}, {
    "pid": "5",
    "cid": "5",
    "quid": "10400",
    "cityname": "道里区"
}, {"pid": "5", "cid": "5", "quid": "10401", "cityname": "南岗区"}, {
    "pid": "5",
    "cid": "5",
    "quid": "10402",
    "cityname": "动力区"
}, {"pid": "5", "cid": "5", "quid": "10403", "cityname": "平房区"}, {
    "pid": "5",
    "cid": "5",
    "quid": "10404",
    "cityname": "香坊区"
}, {"pid": "5", "cid": "5", "quid": "10405", "cityname": "道外区"}, {
    "pid": "5",
    "cid": "5",
    "quid": "10406",
    "cityname": "呼兰区"
}, {"pid": "5", "cid": "149", "quid": "10407", "cityname": "龙沙区"}, {
    "pid": "5",
    "cid": "149",
    "quid": "10408",
    "cityname": "昂昂溪区"
}, {"pid": "5", "cid": "149", "quid": "10409", "cityname": "铁峰区"}, {
    "pid": "5",
    "cid": "149",
    "quid": "10410",
    "cityname": "建华区"
}, {"pid": "5", "cid": "149", "quid": "10411", "cityname": "富拉尔基区"}, {
    "pid": "5",
    "cid": "149",
    "quid": "10412",
    "cityname": "碾子山区"
}, {"pid": "5", "cid": "149", "quid": "10413", "cityname": "梅里斯达斡尔族区"}, {
    "pid": "5",
    "cid": "1999",
    "quid": "10415",
    "cityname": "兴山区"
}, {"pid": "5", "cid": "1999", "quid": "10416", "cityname": "工农区"}, {
    "pid": "5",
    "cid": "1999",
    "quid": "10417",
    "cityname": "南山区"
}, {"pid": "5", "cid": "1999", "quid": "10418", "cityname": "兴安区"}, {
    "pid": "5",
    "cid": "1999",
    "quid": "10419",
    "cityname": "向阳区"
}, {"pid": "5", "cid": "1999", "quid": "10420", "cityname": "东山区"}, {
    "pid": "5",
    "cid": "1485",
    "quid": "10421",
    "cityname": "尖山区"
}, {"pid": "5", "cid": "1485", "quid": "10422", "cityname": "岭东区"}, {
    "pid": "5",
    "cid": "1485",
    "quid": "10423",
    "cityname": "四方台区"
}, {"pid": "5", "cid": "1485", "quid": "10424", "cityname": "宝山区"}, {
    "pid": "5",
    "cid": "157",
    "quid": "10425",
    "cityname": "鸡冠区"
}, {"pid": "5", "cid": "157", "quid": "10426", "cityname": "恒山区"}, {
    "pid": "5",
    "cid": "157",
    "quid": "10427",
    "cityname": "城子河区"
}, {"pid": "5", "cid": "157", "quid": "10428", "cityname": "滴道区"}, {
    "pid": "5",
    "cid": "157",
    "quid": "10429",
    "cityname": "梨树区"
}, {"pid": "5", "cid": "157", "quid": "10430", "cityname": "麻山区"}, {
    "pid": "5",
    "cid": "231",
    "quid": "10431",
    "cityname": "萨尔图区"
}, {"pid": "5", "cid": "231", "quid": "10432", "cityname": "红岗区"}, {
    "pid": "5",
    "cid": "231",
    "quid": "10433",
    "cityname": "龙凤区"
}, {"pid": "5", "cid": "231", "quid": "10434", "cityname": "大同区"}, {
    "pid": "5",
    "cid": "231",
    "quid": "10435",
    "cityname": "让胡路区"
}, {"pid": "5", "cid": "517", "quid": "10436", "cityname": "伊春区"}, {
    "pid": "5",
    "cid": "517",
    "quid": "10437",
    "cityname": "带岭区"
}, {"pid": "5", "cid": "517", "quid": "10438", "cityname": "南岔区"}, {
    "pid": "5",
    "cid": "517",
    "quid": "10439",
    "cityname": "金山屯区"
}, {"pid": "5", "cid": "517", "quid": "10440", "cityname": "西林区"}, {
    "pid": "5",
    "cid": "517",
    "quid": "10441",
    "cityname": "美溪区"
}, {"pid": "5", "cid": "517", "quid": "10442", "cityname": "乌马河区"}, {
    "pid": "5",
    "cid": "517",
    "quid": "10443",
    "cityname": "翠峦区"
}, {"pid": "5", "cid": "517", "quid": "10444", "cityname": "友好区"}, {
    "pid": "5",
    "cid": "517",
    "quid": "10445",
    "cityname": "上甘岭区"
}, {"pid": "5", "cid": "517", "quid": "10446", "cityname": "五营区"}, {
    "pid": "5",
    "cid": "517",
    "quid": "10447",
    "cityname": "红星区"
}, {"pid": "5", "cid": "517", "quid": "10448", "cityname": "新青区"}, {
    "pid": "5",
    "cid": "517",
    "quid": "10449",
    "cityname": "汤旺河区"
}, {"pid": "5", "cid": "517", "quid": "10450", "cityname": "乌伊岭区"}, {
    "pid": "5",
    "cid": "150",
    "quid": "10451",
    "cityname": "爱民区"
}, {"pid": "5", "cid": "150", "quid": "10452", "cityname": "东安区"}, {
    "pid": "5",
    "cid": "150",
    "quid": "10453",
    "cityname": "阳明区"
}, {"pid": "5", "cid": "150", "quid": "10454", "cityname": "西安区"}, {
    "pid": "5",
    "cid": "317",
    "quid": "10455",
    "cityname": "前进区"
}, {"pid": "5", "cid": "317", "quid": "10456", "cityname": "永红区"}, {
    "pid": "5",
    "cid": "317",
    "quid": "10457",
    "cityname": "向阳区"
}, {"pid": "5", "cid": "317", "quid": "10458", "cityname": "东风区"}, {
    "pid": "5",
    "cid": "317",
    "quid": "10459",
    "cityname": "郊区"
}, {"pid": "5", "cid": "1478", "quid": "10460", "cityname": "桃山区"}, {
    "pid": "5",
    "cid": "1478",
    "quid": "10461",
    "cityname": "新兴区"
}, {"pid": "5", "cid": "1478", "quid": "10462", "cityname": "茄子河区"}, {
    "pid": "5",
    "cid": "281",
    "quid": "10463",
    "cityname": "爱辉区"
}, {"pid": "5", "cid": "1128", "quid": "10464", "cityname": "北林区"}, {
    "pid": "5",
    "cid": "517",
    "quid": "11846",
    "cityname": "桃山局"
}, {"pid": "5", "cid": "517", "quid": "11847", "cityname": "朗乡局"}, {
    "pid": "5",
    "cid": "22522",
    "quid": "22560",
    "cityname": "mh"
}, {"pid": "5", "cid": "22522", "quid": "22561", "cityname": "漠河"}, {
    "pid": "6",
    "cid": "456",
    "quid": "161",
    "cityname": "集安市"
}, {"pid": "6", "cid": "158", "quid": "162", "cityname": "农安县"}, {
    "pid": "6",
    "cid": "523",
    "quid": "165",
    "cityname": "敦化市"
}, {"pid": "6", "cid": "198", "quid": "199", "cityname": "长白"}, {
    "pid": "6",
    "cid": "523",
    "quid": "463",
    "cityname": "图们市"
}, {"pid": "6", "cid": "1303", "quid": "962", "cityname": "扶余县"}, {
    "pid": "6",
    "cid": "1220",
    "quid": "1046",
    "cityname": "公主岭市"
}, {"pid": "6", "cid": "456", "quid": "1115", "cityname": "梅河口市"}, {
    "pid": "6",
    "cid": "198",
    "quid": "1302",
    "cityname": "临江市"
}, {"pid": "6", "cid": "523", "quid": "1466", "cityname": "安图县"}, {
    "pid": "6",
    "cid": "456",
    "quid": "2779",
    "cityname": "柳河县"
}, {"pid": "6", "cid": "523", "quid": "2780", "cityname": "龙井市"}, {
    "pid": "6",
    "cid": "523",
    "quid": "2781",
    "cityname": "珲春市"
}, {"pid": "6", "cid": "523", "quid": "2782", "cityname": "和龙市"}, {
    "pid": "6",
    "cid": "523",
    "quid": "2783",
    "cityname": "汪清县"
}, {"pid": "6", "cid": "1116", "quid": "2784", "cityname": "大安市"}, {
    "pid": "6",
    "cid": "1116",
    "quid": "2785",
    "cityname": "洮南市"
}, {"pid": "6", "cid": "1116", "quid": "2786", "cityname": "通榆县"}, {
    "pid": "6",
    "cid": "1116",
    "quid": "2787",
    "cityname": "镇赉县"
}, {"pid": "6", "cid": "1303", "quid": "2788", "cityname": "乾安县"}, {
    "pid": "6",
    "cid": "1303",
    "quid": "2789",
    "cityname": "长岭县"
}, {"pid": "6", "cid": "1303", "quid": "2790", "cityname": "前郭尔罗斯蒙古族自治县"}, {
    "pid": "6",
    "cid": "198",
    "quid": "2791",
    "cityname": "靖宇县"
}, {"pid": "6", "cid": "198", "quid": "2792", "cityname": "抚松县"}, {
    "pid": "6",
    "cid": "198",
    "quid": "2793",
    "cityname": "江源县"
}, {"pid": "6", "cid": "456", "quid": "2794", "cityname": "通化县"}, {
    "pid": "6",
    "cid": "456",
    "quid": "2795",
    "cityname": "辉南县"
}, {"pid": "6", "cid": "2798", "quid": "2796", "cityname": "东丰县"}, {
    "pid": "6",
    "cid": "2798",
    "quid": "2797",
    "cityname": "东辽县"
}, {"pid": "6", "cid": "1220", "quid": "2799", "cityname": "双辽市"}, {
    "pid": "6",
    "cid": "1220",
    "quid": "2800",
    "cityname": "梨树县"
}, {"pid": "6", "cid": "1220", "quid": "2801", "cityname": "伊通满族自治县"}, {
    "pid": "6",
    "cid": "159",
    "quid": "2802",
    "cityname": "舒兰市"
}, {"pid": "6", "cid": "159", "quid": "2803", "cityname": "桦甸市"}, {
    "pid": "6",
    "cid": "159",
    "quid": "2804",
    "cityname": "蛟河市"
}, {"pid": "6", "cid": "159", "quid": "2805", "cityname": "磐石市"}, {
    "pid": "6",
    "cid": "159",
    "quid": "2806",
    "cityname": "永吉县"
}, {"pid": "6", "cid": "158", "quid": "2807", "cityname": "九台市"}, {
    "pid": "6",
    "cid": "158",
    "quid": "2808",
    "cityname": "榆树市"
}, {"pid": "6", "cid": "158", "quid": "2809", "cityname": "德惠市"}, {
    "pid": "6",
    "cid": "158",
    "quid": "10379",
    "cityname": "朝阳区"
}, {"pid": "6", "cid": "158", "quid": "10380", "cityname": "宽城区"}, {
    "pid": "6",
    "cid": "158",
    "quid": "10381",
    "cityname": "二道区"
}, {"pid": "6", "cid": "158", "quid": "10382", "cityname": "南关区"}, {
    "pid": "6",
    "cid": "158",
    "quid": "10383",
    "cityname": "绿园区"
}, {"pid": "6", "cid": "158", "quid": "10384", "cityname": "双阳区"}, {
    "pid": "6",
    "cid": "159",
    "quid": "10385",
    "cityname": "船营区"
}, {"pid": "6", "cid": "159", "quid": "10386", "cityname": "昌邑区"}, {
    "pid": "6",
    "cid": "159",
    "quid": "10387",
    "cityname": "龙潭区"
}, {"pid": "6", "cid": "159", "quid": "10388", "cityname": "丰满区"}, {
    "pid": "6",
    "cid": "1220",
    "quid": "10389",
    "cityname": "铁西区"
}, {"pid": "6", "cid": "1220", "quid": "10390", "cityname": "铁东区"}, {
    "pid": "6",
    "cid": "2798",
    "quid": "10391",
    "cityname": "龙山区"
}, {"pid": "6", "cid": "2798", "quid": "10392", "cityname": "西安区"}, {
    "pid": "6",
    "cid": "456",
    "quid": "10393",
    "cityname": "东昌区"
}, {"pid": "6", "cid": "456", "quid": "10394", "cityname": "二道江区"}, {
    "pid": "6",
    "cid": "198",
    "quid": "10395",
    "cityname": "八道江区"
}, {"pid": "6", "cid": "1303", "quid": "10397", "cityname": "宁江区"}, {
    "pid": "6",
    "cid": "1116",
    "quid": "10398",
    "cityname": "洮北区"
}, {"pid": "6", "cid": "22589", "quid": "22590", "cityname": "池西区"}, {
    "pid": "6",
    "cid": "22589",
    "quid": "22591",
    "cityname": "池北区"
}, {"pid": "6", "cid": "22589", "quid": "22592", "cityname": "池南区"}, {
    "pid": "7",
    "cid": "178",
    "quid": "963",
    "cityname": "海城市"
}, {"pid": "7", "cid": "6", "quid": "966", "cityname": "瓦房店市"}, {
    "pid": "7",
    "cid": "1300",
    "quid": "967",
    "cityname": "大石桥市"
}, {"pid": "7", "cid": "1048", "quid": "1047", "cityname": "昌图县"}, {
    "pid": "7",
    "cid": "1050",
    "quid": "1051",
    "cityname": "兴城市"
}, {"pid": "7", "cid": "211", "quid": "1119", "cityname": "凌源市"}, {
    "pid": "7",
    "cid": "252",
    "quid": "1150",
    "cityname": "清原"
}, {"pid": "7", "cid": "327", "quid": "1157", "cityname": "义县"}, {
    "pid": "7",
    "cid": "6",
    "quid": "1311",
    "cityname": "旅顺口"
}, {"pid": "7", "cid": "211", "quid": "1494", "cityname": "喀喇县"}, {
    "pid": "7",
    "cid": "451",
    "quid": "2671",
    "cityname": "新民市"
}, {"pid": "7", "cid": "451", "quid": "2672", "cityname": "法库县"}, {
    "pid": "7",
    "cid": "451",
    "quid": "2673",
    "cityname": "辽中县"
}, {"pid": "7", "cid": "451", "quid": "2674", "cityname": "康平县"}, {
    "pid": "7",
    "cid": "6",
    "quid": "2675",
    "cityname": "普兰店市"
}, {"pid": "7", "cid": "6", "quid": "2676", "cityname": "庄河市"}, {
    "pid": "7",
    "cid": "6",
    "quid": "2677",
    "cityname": "长海县"
}, {"pid": "7", "cid": "178", "quid": "2678", "cityname": "台安县"}, {
    "pid": "7",
    "cid": "178",
    "quid": "2679",
    "cityname": "岫岩满族自治县"
}, {"pid": "7", "cid": "252", "quid": "2680", "cityname": "抚顺县"}, {
    "pid": "7",
    "cid": "1155",
    "quid": "2681",
    "cityname": "本溪满族自治县"
}, {"pid": "7", "cid": "1155", "quid": "2682", "cityname": "桓仁满族自治县"}, {
    "pid": "7",
    "cid": "221",
    "quid": "2683",
    "cityname": "东港市"
}, {"pid": "7", "cid": "221", "quid": "2684", "cityname": "凤城市"}, {
    "pid": "7",
    "cid": "221",
    "quid": "2685",
    "cityname": "宽甸满族自治县"
}, {"pid": "7", "cid": "327", "quid": "2686", "cityname": "凌海市"}, {
    "pid": "7",
    "cid": "327",
    "quid": "2687",
    "cityname": "北宁市"
}, {"pid": "7", "cid": "327", "quid": "2688", "cityname": "黑山县"}, {
    "pid": "7",
    "cid": "1050",
    "quid": "2689",
    "cityname": "绥中县"
}, {"pid": "7", "cid": "1050", "quid": "2690", "cityname": "建昌县"}, {
    "pid": "7",
    "cid": "1300",
    "quid": "2691",
    "cityname": "盖州市"
}, {"pid": "7", "cid": "387", "quid": "2692", "cityname": "盘山县"}, {
    "pid": "7",
    "cid": "387",
    "quid": "2693",
    "cityname": "大洼县"
}, {"pid": "7", "cid": "254", "quid": "2694", "cityname": "彰武县"}, {
    "pid": "7",
    "cid": "254",
    "quid": "2695",
    "cityname": "阜新蒙古族自治县"
}, {"pid": "7", "cid": "351", "quid": "2696", "cityname": "灯塔市"}, {
    "pid": "7",
    "cid": "351",
    "quid": "2697",
    "cityname": "辽阳县"
}, {"pid": "7", "cid": "1048", "quid": "2698", "cityname": "调兵山市"}, {
    "pid": "7",
    "cid": "1048",
    "quid": "2699",
    "cityname": "开原市"
}, {"pid": "7", "cid": "1048", "quid": "2700", "cityname": "铁岭县"}, {
    "pid": "7",
    "cid": "211",
    "quid": "2701",
    "cityname": "北票市"
}, {"pid": "7", "cid": "211", "quid": "2702", "cityname": "朝阳县"}, {
    "pid": "7",
    "cid": "211",
    "quid": "2703",
    "cityname": "建平县"
}, {"pid": "7", "cid": "1048", "quid": "3036", "cityname": "西丰县"}, {
    "pid": "7",
    "cid": "252",
    "quid": "3037",
    "cityname": "新宾满族自治县"
}, {"pid": "7", "cid": "451", "quid": "10321", "cityname": "沈河区"}, {
    "pid": "7",
    "cid": "451",
    "quid": "10322",
    "cityname": "皇姑区"
}, {"pid": "7", "cid": "451", "quid": "10323", "cityname": "和平区"}, {
    "pid": "7",
    "cid": "451",
    "quid": "10324",
    "cityname": "大东区"
}, {"pid": "7", "cid": "451", "quid": "10325", "cityname": "铁西区"}, {
    "pid": "7",
    "cid": "451",
    "quid": "10326",
    "cityname": "苏家屯区"
}, {"pid": "7", "cid": "451", "quid": "10327", "cityname": "东陵区"}, {
    "pid": "7",
    "cid": "451",
    "quid": "10328",
    "cityname": "新城子区"
}, {"pid": "7", "cid": "451", "quid": "10329", "cityname": "于洪区"}, {
    "pid": "7",
    "cid": "6",
    "quid": "10330",
    "cityname": "西岗区"
}, {"pid": "7", "cid": "6", "quid": "10331", "cityname": "中山区"}, {
    "pid": "7",
    "cid": "6",
    "quid": "10332",
    "cityname": "沙河口区"
}, {"pid": "7", "cid": "6", "quid": "10333", "cityname": "甘井子区"}, {
    "pid": "7",
    "cid": "6",
    "quid": "10334",
    "cityname": "金州区"
}, {"pid": "7", "cid": "178", "quid": "10335", "cityname": "铁东区"}, {
    "pid": "7",
    "cid": "178",
    "quid": "10336",
    "cityname": "铁西区"
}, {"pid": "7", "cid": "178", "quid": "10337", "cityname": "立山区"}, {
    "pid": "7",
    "cid": "178",
    "quid": "10338",
    "cityname": "千山区"
}, {"pid": "7", "cid": "252", "quid": "10339", "cityname": "顺城区"}, {
    "pid": "7",
    "cid": "252",
    "quid": "10340",
    "cityname": "新抚区"
}, {"pid": "7", "cid": "252", "quid": "10341", "cityname": "东洲区"}, {
    "pid": "7",
    "cid": "252",
    "quid": "10342",
    "cityname": "望花区"
}, {"pid": "7", "cid": "1155", "quid": "10343", "cityname": "平山区"}, {
    "pid": "7",
    "cid": "1155",
    "quid": "10344",
    "cityname": "明山区"
}, {"pid": "7", "cid": "1155", "quid": "10345", "cityname": "溪湖区"}, {
    "pid": "7",
    "cid": "1155",
    "quid": "10346",
    "cityname": "南芬区"
}, {"pid": "7", "cid": "221", "quid": "10347", "cityname": "振兴区"}, {
    "pid": "7",
    "cid": "221",
    "quid": "10348",
    "cityname": "元宝区"
}, {"pid": "7", "cid": "221", "quid": "10349", "cityname": "振安区"}, {
    "pid": "7",
    "cid": "327",
    "quid": "10350",
    "cityname": "太和区"
}, {"pid": "7", "cid": "327", "quid": "10351", "cityname": "古塔区"}, {
    "pid": "7",
    "cid": "327",
    "quid": "10352",
    "cityname": "凌河区"
}, {"pid": "7", "cid": "1050", "quid": "10356", "cityname": "龙港区"}, {
    "pid": "7",
    "cid": "1050",
    "quid": "10357",
    "cityname": "南票区"
}, {"pid": "7", "cid": "1050", "quid": "10358", "cityname": "连山区"}, {
    "pid": "7",
    "cid": "1300",
    "quid": "10359",
    "cityname": "站前区"
}, {"pid": "7", "cid": "1300", "quid": "10360", "cityname": "西市区"}, {
    "pid": "7",
    "cid": "1300",
    "quid": "10361",
    "cityname": "鲅鱼圈区"
}, {"pid": "7", "cid": "1300", "quid": "10362", "cityname": "老边区"}, {
    "pid": "7",
    "cid": "387",
    "quid": "10363",
    "cityname": "双台子区"
}, {"pid": "7", "cid": "387", "quid": "10364", "cityname": "兴隆台区"}, {
    "pid": "7",
    "cid": "254",
    "quid": "10365",
    "cityname": "海州区"
}, {"pid": "7", "cid": "254", "quid": "10366", "cityname": "新邱区"}, {
    "pid": "7",
    "cid": "254",
    "quid": "10367",
    "cityname": "太平区"
}, {"pid": "7", "cid": "254", "quid": "10368", "cityname": "清河门区"}, {
    "pid": "7",
    "cid": "254",
    "quid": "10369",
    "cityname": "细河区"
}, {"pid": "7", "cid": "351", "quid": "10370", "cityname": "白塔区"}, {
    "pid": "7",
    "cid": "351",
    "quid": "10371",
    "cityname": "文圣区"
}, {"pid": "7", "cid": "351", "quid": "10372", "cityname": "宏伟区"}, {
    "pid": "7",
    "cid": "351",
    "quid": "10373",
    "cityname": "太子河区"
}, {"pid": "7", "cid": "351", "quid": "10374", "cityname": "弓长岭区"}, {
    "pid": "7",
    "cid": "1048",
    "quid": "10375",
    "cityname": "银州区"
}, {"pid": "7", "cid": "1048", "quid": "10376", "cityname": "清河区"}, {
    "pid": "7",
    "cid": "211",
    "quid": "10377",
    "cityname": "双塔区"
}, {"pid": "7", "cid": "211", "quid": "10378", "cityname": "龙城区"}, {
    "pid": "7",
    "cid": "6",
    "quid": "22503",
    "cityname": "开发区"
}, {"pid": "7", "cid": "451", "quid": "22565", "cityname": "沈北新区"}, {
    "pid": "8",
    "cid": "147",
    "quid": "187",
    "cityname": "北戴河"
}, {"pid": "8", "cid": "562", "quid": "373", "cityname": "隆化县"}, {
    "pid": "8",
    "cid": "562",
    "quid": "499",
    "cityname": "兴隆县"
}, {"pid": "8", "cid": "216", "quid": "502", "cityname": "青县"}, {
    "pid": "8",
    "cid": "468",
    "quid": "545",
    "cityname": "遵化市"
}, {"pid": "8", "cid": "216", "quid": "887", "cityname": "吴桥县"}, {
    "pid": "8",
    "cid": "428",
    "quid": "905",
    "cityname": "辛集市"
}, {"pid": "8", "cid": "947", "quid": "949", "cityname": "沙河市"}, {
    "pid": "8",
    "cid": "147",
    "quid": "1052",
    "cityname": "昌黎县"
}, {"pid": "8", "cid": "468", "quid": "1053", "cityname": "滦县"}, {
    "pid": "8",
    "cid": "340",
    "quid": "1068",
    "cityname": "霸州市"
}, {"pid": "8", "cid": "216", "quid": "1069", "cityname": "任丘市"}, {
    "pid": "8",
    "cid": "216",
    "quid": "1070",
    "cityname": "肃宁县"
}, {"pid": "8", "cid": "562", "quid": "1118", "cityname": "平泉县"}, {
    "pid": "8",
    "cid": "550",
    "quid": "1131",
    "cityname": "怀来县"
}, {"pid": "8", "cid": "275", "quid": "1221", "cityname": "涉县"}, {
    "pid": "8",
    "cid": "147",
    "quid": "1226",
    "cityname": "南戴河"
}, {"pid": "8", "cid": "947", "quid": "1306", "cityname": "临西县"}, {
    "pid": "8",
    "cid": "216",
    "quid": "1486",
    "cityname": "献县"
}, {"pid": "8", "cid": "216", "quid": "1487", "cityname": "南皮县"}, {
    "pid": "8",
    "cid": "275",
    "quid": "1489",
    "cityname": "馆陶县"
}, {"pid": "8", "cid": "562", "quid": "1528", "cityname": "围场"}, {
    "pid": "8",
    "cid": "185",
    "quid": "1768",
    "cityname": "涞源县"
}, {"pid": "8", "cid": "428", "quid": "1769", "cityname": "平山县"}, {
    "pid": "8",
    "cid": "428",
    "quid": "1770",
    "cityname": "赵县"
}, {"pid": "8", "cid": "428", "quid": "2322", "cityname": "井陉县"}, {
    "pid": "8",
    "cid": "428",
    "quid": "2323",
    "cityname": "栾城县"
}, {"pid": "8", "cid": "428", "quid": "2324", "cityname": "正定县"}, {
    "pid": "8",
    "cid": "428",
    "quid": "2325",
    "cityname": "行唐县"
}, {"pid": "8", "cid": "428", "quid": "2326", "cityname": "灵寿县"}, {
    "pid": "8",
    "cid": "428",
    "quid": "2327",
    "cityname": "高邑县"
}, {"pid": "8", "cid": "428", "quid": "2328", "cityname": "元氏县"}, {
    "pid": "8",
    "cid": "428",
    "quid": "2329",
    "cityname": "赞皇县"
}, {"pid": "8", "cid": "428", "quid": "2330", "cityname": "深泽县"}, {
    "pid": "8",
    "cid": "428",
    "quid": "2331",
    "cityname": "无极县"
}, {"pid": "8", "cid": "468", "quid": "2332", "cityname": "迁安市"}, {
    "pid": "8",
    "cid": "468",
    "quid": "2333",
    "cityname": "迁西县"
}, {"pid": "8", "cid": "468", "quid": "2334", "cityname": "滦南县"}, {
    "pid": "8",
    "cid": "468",
    "quid": "2335",
    "cityname": "玉田县"
}, {"pid": "8", "cid": "468", "quid": "2336", "cityname": "唐海县"}, {
    "pid": "8",
    "cid": "468",
    "quid": "2337",
    "cityname": "乐亭县"
}, {"pid": "8", "cid": "147", "quid": "2338", "cityname": "卢龙县"}, {
    "pid": "8",
    "cid": "147",
    "quid": "2339",
    "cityname": "抚宁县"
}, {"pid": "8", "cid": "147", "quid": "2340", "cityname": "青龙满族自治县"}, {
    "pid": "8",
    "cid": "275",
    "quid": "2341",
    "cityname": "邯郸县"
}, {"pid": "8", "cid": "275", "quid": "2342", "cityname": "武安市"}, {
    "pid": "8",
    "cid": "275",
    "quid": "2343",
    "cityname": "永年县"
}, {"pid": "8", "cid": "275", "quid": "2344", "cityname": "曲周县"}, {
    "pid": "8",
    "cid": "275",
    "quid": "2345",
    "cityname": "魏县"
}, {"pid": "8", "cid": "275", "quid": "2346", "cityname": "成安县"}, {
    "pid": "8",
    "cid": "275",
    "quid": "2347",
    "cityname": "大名县"
}, {"pid": "8", "cid": "275", "quid": "2348", "cityname": "鸡泽县"}, {
    "pid": "8",
    "cid": "275",
    "quid": "2349",
    "cityname": "邱县"
}, {"pid": "8", "cid": "275", "quid": "2350", "cityname": "广平县"}, {
    "pid": "8",
    "cid": "275",
    "quid": "2351",
    "cityname": "肥乡县"
}, {"pid": "8", "cid": "275", "quid": "2352", "cityname": "临漳县"}, {
    "pid": "8",
    "cid": "275",
    "quid": "2353",
    "cityname": "磁县"
}, {"pid": "8", "cid": "947", "quid": "2354", "cityname": "南宫市"}, {
    "pid": "8",
    "cid": "947",
    "quid": "2355",
    "cityname": "邢台县"
}, {"pid": "8", "cid": "947", "quid": "2356", "cityname": "柏乡县"}, {
    "pid": "8",
    "cid": "947",
    "quid": "2357",
    "cityname": "任县"
}, {"pid": "8", "cid": "947", "quid": "2358", "cityname": "清河县"}, {
    "pid": "8",
    "cid": "947",
    "quid": "2359",
    "cityname": "宁晋县"
}, {"pid": "8", "cid": "947", "quid": "2360", "cityname": "威县"}, {
    "pid": "8",
    "cid": "947",
    "quid": "2361",
    "cityname": "隆尧县"
}, {"pid": "8", "cid": "947", "quid": "2362", "cityname": "临城县"}, {
    "pid": "8",
    "cid": "947",
    "quid": "2363",
    "cityname": "广宗县"
}, {"pid": "8", "cid": "947", "quid": "2364", "cityname": "内丘县"}, {
    "pid": "8",
    "cid": "947",
    "quid": "2365",
    "cityname": "平乡县"
}, {"pid": "8", "cid": "947", "quid": "2366", "cityname": "巨鹿县"}, {
    "pid": "8",
    "cid": "947",
    "quid": "2367",
    "cityname": "新河县"
}, {"pid": "8", "cid": "947", "quid": "2368", "cityname": "南和县"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2369",
    "cityname": "涿州市"
}, {"pid": "8", "cid": "185", "quid": "2370", "cityname": "定州市"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2371",
    "cityname": "安国市"
}, {"pid": "8", "cid": "185", "quid": "2372", "cityname": "高碑店市"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2373",
    "cityname": "满城县"
}, {"pid": "8", "cid": "185", "quid": "2374", "cityname": "清苑县"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2375",
    "cityname": "涞水县"
}, {"pid": "8", "cid": "185", "quid": "2376", "cityname": "阜平县"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2377",
    "cityname": "徐水县"
}, {"pid": "8", "cid": "185", "quid": "2378", "cityname": "定兴县"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2379",
    "cityname": "唐县"
}, {"pid": "8", "cid": "185", "quid": "2380", "cityname": "高阳县"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2381",
    "cityname": "容城县"
}, {"pid": "8", "cid": "185", "quid": "2382", "cityname": "望都县"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2383",
    "cityname": "安新县"
}, {"pid": "8", "cid": "185", "quid": "2384", "cityname": "易县"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2385",
    "cityname": "曲阳县"
}, {"pid": "8", "cid": "185", "quid": "2386", "cityname": "蠡县"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2387",
    "cityname": "顺平县"
}, {"pid": "8", "cid": "185", "quid": "2388", "cityname": "博野县"}, {
    "pid": "8",
    "cid": "185",
    "quid": "2389",
    "cityname": "雄县"
}, {"pid": "8", "cid": "550", "quid": "2390", "cityname": "宣化县"}, {
    "pid": "8",
    "cid": "550",
    "quid": "2391",
    "cityname": "康保县"
}, {"pid": "8", "cid": "550", "quid": "2392", "cityname": "张北县"}, {
    "pid": "8",
    "cid": "550",
    "quid": "2393",
    "cityname": "阳原县"
}, {"pid": "8", "cid": "550", "quid": "2394", "cityname": "赤城县"}, {
    "pid": "8",
    "cid": "550",
    "quid": "2395",
    "cityname": "沽源县"
}, {"pid": "8", "cid": "550", "quid": "2396", "cityname": "怀安县"}, {
    "pid": "8",
    "cid": "550",
    "quid": "2397",
    "cityname": "崇礼县"
}, {"pid": "8", "cid": "550", "quid": "2398", "cityname": "尚义县"}, {
    "pid": "8",
    "cid": "550",
    "quid": "2399",
    "cityname": "蔚县"
}, {"pid": "8", "cid": "550", "quid": "2400", "cityname": "涿鹿县"}, {
    "pid": "8",
    "cid": "550",
    "quid": "2401",
    "cityname": "万全县"
}, {"pid": "8", "cid": "562", "quid": "2402", "cityname": "承德县"}, {
    "pid": "8",
    "cid": "562",
    "quid": "2403",
    "cityname": "滦平县"
}, {"pid": "8", "cid": "562", "quid": "2404", "cityname": "丰宁"}, {
    "pid": "8",
    "cid": "562",
    "quid": "2405",
    "cityname": "宽城满族自治县"
}, {"pid": "8", "cid": "216", "quid": "2406", "cityname": "泊头市"}, {
    "pid": "8",
    "cid": "216",
    "quid": "2407",
    "cityname": "黄骅市"
}, {"pid": "8", "cid": "216", "quid": "2408", "cityname": "河间市"}, {
    "pid": "8",
    "cid": "216",
    "quid": "2409",
    "cityname": "沧县"
}, {"pid": "8", "cid": "216", "quid": "2410", "cityname": "东光县"}, {
    "pid": "8",
    "cid": "216",
    "quid": "2411",
    "cityname": "海兴县"
}, {"pid": "8", "cid": "216", "quid": "2412", "cityname": "盐山县"}, {
    "pid": "8",
    "cid": "216",
    "quid": "2413",
    "cityname": "孟村回族自治县"
}, {"pid": "8", "cid": "340", "quid": "2414", "cityname": "三河市"}, {
    "pid": "8",
    "cid": "340",
    "quid": "2415",
    "cityname": "固安县"
}, {"pid": "8", "cid": "340", "quid": "2416", "cityname": "永清县"}, {
    "pid": "8",
    "cid": "340",
    "quid": "2417",
    "cityname": "香河县"
}, {"pid": "8", "cid": "340", "quid": "2418", "cityname": "大城县"}, {
    "pid": "8",
    "cid": "340",
    "quid": "2419",
    "cityname": "文安县"
}, {"pid": "8", "cid": "340", "quid": "2420", "cityname": "大厂回族自治县"}, {
    "pid": "8",
    "cid": "290",
    "quid": "2421",
    "cityname": "冀州市"
}, {"pid": "8", "cid": "290", "quid": "2422", "cityname": "深州市"}, {
    "pid": "8",
    "cid": "290",
    "quid": "2423",
    "cityname": "饶阳县"
}, {"pid": "8", "cid": "290", "quid": "2424", "cityname": "枣强县"}, {
    "pid": "8",
    "cid": "290",
    "quid": "2425",
    "cityname": "故城县"
}, {"pid": "8", "cid": "290", "quid": "2426", "cityname": "阜城县"}, {
    "pid": "8",
    "cid": "290",
    "quid": "2427",
    "cityname": "安平县"
}, {"pid": "8", "cid": "290", "quid": "2428", "cityname": "武邑县"}, {
    "pid": "8",
    "cid": "290",
    "quid": "2429",
    "cityname": "景县"
}, {"pid": "8", "cid": "290", "quid": "2430", "cityname": "武强县"}, {
    "pid": "8",
    "cid": "428",
    "quid": "10243",
    "cityname": "长安区"
}, {"pid": "8", "cid": "428", "quid": "10244", "cityname": "桥东区"}, {
    "pid": "8",
    "cid": "428",
    "quid": "10245",
    "cityname": "桥西区"
}, {"pid": "8", "cid": "428", "quid": "10246", "cityname": "新华区"}, {
    "pid": "8",
    "cid": "428",
    "quid": "10247",
    "cityname": "裕华区"
}, {"pid": "8", "cid": "428", "quid": "10248", "cityname": "井陉矿区"}, {
    "pid": "8",
    "cid": "468",
    "quid": "10249",
    "cityname": "路北区"
}, {"pid": "8", "cid": "468", "quid": "10250", "cityname": "路南区"}, {
    "pid": "8",
    "cid": "468",
    "quid": "10251",
    "cityname": "古冶区"
}, {"pid": "8", "cid": "468", "quid": "10252", "cityname": "开平区"}, {
    "pid": "8",
    "cid": "468",
    "quid": "10253",
    "cityname": "丰润区"
}, {"pid": "8", "cid": "468", "quid": "10254", "cityname": "丰南区"}, {
    "pid": "8",
    "cid": "147",
    "quid": "10255",
    "cityname": "海港区"
}, {"pid": "8", "cid": "147", "quid": "10256", "cityname": "山海关区"}, {
    "pid": "8",
    "cid": "275",
    "quid": "10257",
    "cityname": "丛台区"
}, {"pid": "8", "cid": "275", "quid": "10258", "cityname": "复兴区"}, {
    "pid": "8",
    "cid": "275",
    "quid": "10259",
    "cityname": "邯山区"
}, {"pid": "8", "cid": "275", "quid": "10260", "cityname": "峰峰矿区"}, {
    "pid": "8",
    "cid": "947",
    "quid": "10261",
    "cityname": "桥东区"
}, {"pid": "8", "cid": "947", "quid": "10262", "cityname": "桥西区"}, {
    "pid": "8",
    "cid": "185",
    "quid": "10263",
    "cityname": "新市区"
}, {"pid": "8", "cid": "185", "quid": "10264", "cityname": "南市区"}, {
    "pid": "8",
    "cid": "185",
    "quid": "10265",
    "cityname": "北市区"
}, {"pid": "8", "cid": "550", "quid": "10266", "cityname": "桥西区"}, {
    "pid": "8",
    "cid": "550",
    "quid": "10267",
    "cityname": "桥东区"
}, {"pid": "8", "cid": "550", "quid": "10268", "cityname": "宣化区"}, {
    "pid": "8",
    "cid": "550",
    "quid": "10269",
    "cityname": "下花园区"
}, {"pid": "8", "cid": "562", "quid": "10270", "cityname": "双桥区"}, {
    "pid": "8",
    "cid": "562",
    "quid": "10271",
    "cityname": "双滦区"
}, {"pid": "8", "cid": "562", "quid": "10272", "cityname": "鹰手营子矿区"}, {
    "pid": "8",
    "cid": "216",
    "quid": "10273",
    "cityname": "运河区"
}, {"pid": "8", "cid": "216", "quid": "10274", "cityname": "新华区"}, {
    "pid": "8",
    "cid": "340",
    "quid": "10275",
    "cityname": "安次区"
}, {"pid": "8", "cid": "340", "quid": "10276", "cityname": "广阳区"}, {
    "pid": "8",
    "cid": "290",
    "quid": "10277",
    "cityname": "桃城区"
}, {"pid": "8", "cid": "147", "quid": "22524", "cityname": "开发区"}, {
    "pid": "8",
    "cid": "22566",
    "quid": "22567",
    "cityname": "磁山镇"
}, {"pid": "8", "cid": "947", "quid": "22576", "cityname": "市区"}, {
    "pid": "9",
    "cid": "559",
    "quid": "222",
    "cityname": "登封市"
}, {"pid": "9", "cid": "331", "quid": "897", "cityname": "兰考县"}, {
    "pid": "9",
    "cid": "441",
    "quid": "898",
    "cityname": "民权县"
}, {"pid": "9", "cid": "441", "quid": "899", "cityname": "虞城县"}, {
    "pid": "9",
    "cid": "181",
    "quid": "950",
    "cityname": "汤阴县"
}, {"pid": "9", "cid": "441", "quid": "952", "cityname": "夏邑县"}, {
    "pid": "9",
    "cid": "350",
    "quid": "957",
    "cityname": "偃师市"
}, {"pid": "9", "cid": "559", "quid": "958", "cityname": "巩义市"}, {
    "pid": "9",
    "cid": "559",
    "quid": "969",
    "cityname": "荥阳市"
}, {"pid": "9", "cid": "436", "quid": "1023", "cityname": "灵宝市"}, {
    "pid": "9",
    "cid": "436",
    "quid": "1025",
    "cityname": "渑池县"
}, {"pid": "9", "cid": "436", "quid": "1029", "cityname": "义马市"}, {
    "pid": "9",
    "cid": "385",
    "quid": "1058",
    "cityname": "邓州市"
}, {"pid": "9", "cid": "386", "quid": "1059", "cityname": "宝丰县"}, {
    "pid": "9",
    "cid": "386",
    "quid": "1060",
    "cityname": "汝州市"
}, {"pid": "9", "cid": "510", "quid": "1075", "cityname": "潢川县"}, {
    "pid": "9",
    "cid": "510",
    "quid": "1076",
    "cityname": "新县"
}, {"pid": "9", "cid": "1545", "quid": "1320", "cityname": "沈丘县"}, {
    "pid": "9",
    "cid": "559",
    "quid": "1454",
    "cityname": "济源市"
}, {"pid": "9", "cid": "1088", "quid": "1491", "cityname": "舞阳县"}, {
    "pid": "9",
    "cid": "441",
    "quid": "1535",
    "cityname": "永城市"
}, {"pid": "9", "cid": "386", "quid": "1536", "cityname": "鲁山县"}, {
    "pid": "9",
    "cid": "1094",
    "quid": "1538",
    "cityname": "禹州市"
}, {"pid": "9", "cid": "1094", "quid": "1539", "cityname": "长葛市"}, {
    "pid": "9",
    "cid": "1094",
    "quid": "1540",
    "cityname": "鄢陵县"
}, {"pid": "9", "cid": "951", "quid": "1541", "cityname": "浚县"}, {
    "pid": "9",
    "cid": "551",
    "quid": "1542",
    "cityname": "遂平县"
}, {"pid": "9", "cid": "551", "quid": "1543", "cityname": "西平县"}, {
    "pid": "9",
    "cid": "551",
    "quid": "1544",
    "cityname": "汝南县"
}, {"pid": "9", "cid": "1545", "quid": "1546", "cityname": "鹿邑县"}, {
    "pid": "9",
    "cid": "1545",
    "quid": "1547",
    "cityname": "项城市"
}, {"pid": "9", "cid": "1093", "quid": "1548", "cityname": "沁阳市"}, {
    "pid": "9",
    "cid": "1093",
    "quid": "1549",
    "cityname": "孟州市"
}, {"pid": "9", "cid": "507", "quid": "1550", "cityname": "卫辉市"}, {
    "pid": "9",
    "cid": "507",
    "quid": "1551",
    "cityname": "辉县市"
}, {"pid": "9", "cid": "1093", "quid": "1580", "cityname": "温县"}, {
    "pid": "9",
    "cid": "1093",
    "quid": "1581",
    "cityname": "武陟县"
}, {"pid": "9", "cid": "1093", "quid": "1582", "cityname": "修武县"}, {
    "pid": "9",
    "cid": "1093",
    "quid": "1583",
    "cityname": "博爱县"
}, {"pid": "9", "cid": "559", "quid": "2434", "cityname": "新郑市"}, {
    "pid": "9",
    "cid": "559",
    "quid": "2435",
    "cityname": "新密市"
}, {"pid": "9", "cid": "559", "quid": "2436", "cityname": "中牟县"}, {
    "pid": "9",
    "cid": "331",
    "quid": "2437",
    "cityname": "开封县"
}, {"pid": "9", "cid": "331", "quid": "2438", "cityname": "尉氏县"}, {
    "pid": "9",
    "cid": "331",
    "quid": "2439",
    "cityname": "杞县"
}, {"pid": "9", "cid": "331", "quid": "2440", "cityname": "通许县"}, {
    "pid": "9",
    "cid": "350",
    "quid": "2441",
    "cityname": "孟津县"
}, {"pid": "9", "cid": "350", "quid": "2442", "cityname": "汝阳县"}, {
    "pid": "9",
    "cid": "350",
    "quid": "2443",
    "cityname": "伊川县"
}, {"pid": "9", "cid": "350", "quid": "2444", "cityname": "洛宁县"}, {
    "pid": "9",
    "cid": "350",
    "quid": "2445",
    "cityname": "嵩县"
}, {"pid": "9", "cid": "350", "quid": "2446", "cityname": "宜阳县"}, {
    "pid": "9",
    "cid": "350",
    "quid": "2447",
    "cityname": "新安县"
}, {"pid": "9", "cid": "350", "quid": "2448", "cityname": "栾川县"}, {
    "pid": "9",
    "cid": "386",
    "quid": "2449",
    "cityname": "舞钢市"
}, {"pid": "9", "cid": "386", "quid": "2450", "cityname": "叶县"}, {
    "pid": "9",
    "cid": "386",
    "quid": "2451",
    "cityname": "郏县"
}, {"pid": "9", "cid": "951", "quid": "2452", "cityname": "淇县"}, {
    "pid": "9",
    "cid": "507",
    "quid": "2453",
    "cityname": "获嘉县"
}, {"pid": "9", "cid": "507", "quid": "2454", "cityname": "原阳县"}, {
    "pid": "9",
    "cid": "507",
    "quid": "2455",
    "cityname": "长垣县"
}, {"pid": "9", "cid": "507", "quid": "2456", "cityname": "封丘县"}, {
    "pid": "9",
    "cid": "507",
    "quid": "2457",
    "cityname": "延津县"
}, {"pid": "9", "cid": "181", "quid": "2458", "cityname": "安阳县"}, {
    "pid": "9",
    "cid": "181",
    "quid": "2459",
    "cityname": "滑县"
}, {"pid": "9", "cid": "181", "quid": "2460", "cityname": "内黄县"}, {
    "pid": "9",
    "cid": "1232",
    "quid": "2461",
    "cityname": "濮阳县"
}, {"pid": "9", "cid": "1232", "quid": "2462", "cityname": "南乐县"}, {
    "pid": "9",
    "cid": "1232",
    "quid": "2463",
    "cityname": "台前县"
}, {"pid": "9", "cid": "1232", "quid": "2464", "cityname": "清丰县"}, {
    "pid": "9",
    "cid": "1232",
    "quid": "2465",
    "cityname": "范县"
}, {"pid": "9", "cid": "1094", "quid": "2466", "cityname": "许昌县"}, {
    "pid": "9",
    "cid": "1094",
    "quid": "2467",
    "cityname": "襄城县"
}, {"pid": "9", "cid": "1088", "quid": "2468", "cityname": "临颍县"}, {
    "pid": "9",
    "cid": "436",
    "quid": "2469",
    "cityname": "卢氏县"
}, {"pid": "9", "cid": "436", "quid": "2470", "cityname": "陕县"}, {
    "pid": "9",
    "cid": "385",
    "quid": "2471",
    "cityname": "桐柏县"
}, {"pid": "9", "cid": "385", "quid": "2472", "cityname": "方城县"}, {
    "pid": "9",
    "cid": "385",
    "quid": "2473",
    "cityname": "淅川县"
}, {"pid": "9", "cid": "385", "quid": "2474", "cityname": "镇平县"}, {
    "pid": "9",
    "cid": "385",
    "quid": "2475",
    "cityname": "唐河县"
}, {"pid": "9", "cid": "385", "quid": "2476", "cityname": "南召县"}, {
    "pid": "9",
    "cid": "385",
    "quid": "2477",
    "cityname": "内乡县"
}, {"pid": "9", "cid": "385", "quid": "2478", "cityname": "新野县"}, {
    "pid": "9",
    "cid": "385",
    "quid": "2479",
    "cityname": "社旗县"
}, {"pid": "9", "cid": "385", "quid": "2480", "cityname": "西峡县"}, {
    "pid": "9",
    "cid": "441",
    "quid": "2481",
    "cityname": "柘城县"
}, {"pid": "9", "cid": "441", "quid": "2482", "cityname": "睢县"}, {
    "pid": "9",
    "cid": "510",
    "quid": "2484",
    "cityname": "息县"
}, {"pid": "9", "cid": "510", "quid": "2485", "cityname": "商城县"}, {
    "pid": "9",
    "cid": "510",
    "quid": "2486",
    "cityname": "固始县"
}, {"pid": "9", "cid": "510", "quid": "2487", "cityname": "罗山县"}, {
    "pid": "9",
    "cid": "510",
    "quid": "2488",
    "cityname": "光山县"
}, {"pid": "9", "cid": "1545", "quid": "2489", "cityname": "商水县"}, {
    "pid": "9",
    "cid": "1545",
    "quid": "2490",
    "cityname": "淮阳县"
}, {"pid": "9", "cid": "1545", "quid": "2491", "cityname": "太康县"}, {
    "pid": "9",
    "cid": "1545",
    "quid": "2492",
    "cityname": "西华县"
}, {"pid": "9", "cid": "1545", "quid": "2493", "cityname": "扶沟县"}, {
    "pid": "9",
    "cid": "1545",
    "quid": "2494",
    "cityname": "郸城县"
}, {"pid": "9", "cid": "551", "quid": "2495", "cityname": "确山县"}, {
    "pid": "9",
    "cid": "551",
    "quid": "2496",
    "cityname": "新蔡县"
}, {"pid": "9", "cid": "551", "quid": "2497", "cityname": "上蔡县"}, {
    "pid": "9",
    "cid": "551",
    "quid": "2498",
    "cityname": "泌阳县"
}, {"pid": "9", "cid": "551", "quid": "2499", "cityname": "平舆县"}, {
    "pid": "9",
    "cid": "551",
    "quid": "2500",
    "cityname": "正阳县"
}, {"pid": "9", "cid": "510", "quid": "3038", "cityname": "淮滨县"}, {
    "pid": "9",
    "cid": "507",
    "quid": "3039",
    "cityname": "新乡县"
}, {"pid": "9", "cid": "181", "quid": "3040", "cityname": "林州市"}, {
    "pid": "9",
    "cid": "1088",
    "quid": "3041",
    "cityname": "郾城县"
}, {"pid": "9", "cid": "441", "quid": "3042", "cityname": "宁陵县"}, {
    "pid": "9",
    "cid": "441",
    "quid": "3043",
    "cityname": "雎县"
}, {"pid": "9", "cid": "559", "quid": "10513", "cityname": "中原区"}, {
    "pid": "9",
    "cid": "559",
    "quid": "10514",
    "cityname": "金水区"
}, {"pid": "9", "cid": "559", "quid": "10515", "cityname": "二七区"}, {
    "pid": "9",
    "cid": "559",
    "quid": "10516",
    "cityname": "管城区"
}, {"pid": "9", "cid": "559", "quid": "10517", "cityname": "上街区"}, {
    "pid": "9",
    "cid": "559",
    "quid": "10518",
    "cityname": "惠济区"
}, {"pid": "9", "cid": "331", "quid": "10519", "cityname": "鼓楼区"}, {
    "pid": "9",
    "cid": "331",
    "quid": "10520",
    "cityname": "龙亭区"
}, {"pid": "9", "cid": "331", "quid": "10521", "cityname": "顺河回族区"}, {
    "pid": "9",
    "cid": "331",
    "quid": "10522",
    "cityname": "南关区"
}, {"pid": "9", "cid": "331", "quid": "10523", "cityname": "郊　区"}, {
    "pid": "9",
    "cid": "350",
    "quid": "10524",
    "cityname": "西工区"
}, {"pid": "9", "cid": "350", "quid": "10525", "cityname": "老城区"}, {
    "pid": "9",
    "cid": "350",
    "quid": "10526",
    "cityname": "涧西区"
}, {"pid": "9", "cid": "350", "quid": "10527", "cityname": "瀍河回族区"}, {
    "pid": "9",
    "cid": "350",
    "quid": "10528",
    "cityname": "洛龙区"
}, {"pid": "9", "cid": "350", "quid": "10529", "cityname": "吉利区"}, {
    "pid": "9",
    "cid": "386",
    "quid": "10530",
    "cityname": "新华区"
}, {"pid": "9", "cid": "386", "quid": "10531", "cityname": "卫东区"}, {
    "pid": "9",
    "cid": "386",
    "quid": "10532",
    "cityname": "湛河区"
}, {"pid": "9", "cid": "386", "quid": "10533", "cityname": "石龙区"}, {
    "pid": "9",
    "cid": "1093",
    "quid": "10534",
    "cityname": "解放区"
}, {"pid": "9", "cid": "1093", "quid": "10535", "cityname": "中站区"}, {
    "pid": "9",
    "cid": "1093",
    "quid": "10536",
    "cityname": "马村区"
}, {"pid": "9", "cid": "1093", "quid": "10537", "cityname": "山阳区"}, {
    "pid": "9",
    "cid": "951",
    "quid": "10538",
    "cityname": "淇滨区"
}, {"pid": "9", "cid": "951", "quid": "10539", "cityname": "山城区"}, {
    "pid": "9",
    "cid": "951",
    "quid": "10540",
    "cityname": "鹤山区"
}, {"pid": "9", "cid": "507", "quid": "10541", "cityname": "卫滨区"}, {
    "pid": "9",
    "cid": "507",
    "quid": "10542",
    "cityname": "红旗区"
}, {"pid": "9", "cid": "507", "quid": "10543", "cityname": "凤泉区"}, {
    "pid": "9",
    "cid": "507",
    "quid": "10544",
    "cityname": "牧野区"
}, {"pid": "9", "cid": "181", "quid": "10545", "cityname": "北关区"}, {
    "pid": "9",
    "cid": "181",
    "quid": "10546",
    "cityname": "文峰区"
}, {"pid": "9", "cid": "181", "quid": "10547", "cityname": "殷都区"}, {
    "pid": "9",
    "cid": "181",
    "quid": "10548",
    "cityname": "龙安区"
}, {"pid": "9", "cid": "1232", "quid": "10549", "cityname": "华龙区"}, {
    "pid": "9",
    "cid": "1094",
    "quid": "10550",
    "cityname": "魏都区"
}, {"pid": "9", "cid": "1088", "quid": "10551", "cityname": "召陵区"}, {
    "pid": "9",
    "cid": "1088",
    "quid": "10552",
    "cityname": "郾城区"
}, {"pid": "9", "cid": "1088", "quid": "10553", "cityname": "源汇区"}, {
    "pid": "9",
    "cid": "436",
    "quid": "10554",
    "cityname": "湖滨区"
}, {"pid": "9", "cid": "385", "quid": "10555", "cityname": "卧龙区"}, {
    "pid": "9",
    "cid": "385",
    "quid": "10556",
    "cityname": "宛城区"
}, {"pid": "9", "cid": "441", "quid": "10557", "cityname": "梁园区"}, {
    "pid": "9",
    "cid": "441",
    "quid": "10558",
    "cityname": "睢阳区"
}, {"pid": "9", "cid": "510", "quid": "10559", "cityname": "浉河区"}, {
    "pid": "9",
    "cid": "510",
    "quid": "10560",
    "cityname": "平桥区"
}, {"pid": "9", "cid": "1545", "quid": "10561", "cityname": "川汇区"}, {
    "pid": "9",
    "cid": "551",
    "quid": "10562",
    "cityname": "驿城区"
}, {"pid": "9", "cid": "331", "quid": "22028", "cityname": "李金岭"}, {
    "pid": "9",
    "cid": "331",
    "quid": "22029",
    "cityname": "金水区"
}, {"pid": "10", "cid": "318", "quid": "143", "cityname": "曲阜市"}, {
    "pid": "10",
    "cid": "1370",
    "quid": "188",
    "cityname": "齐河县"
}, {"pid": "10", "cid": "533", "quid": "310", "cityname": "蓬莱市"}, {
    "pid": "10",
    "cid": "318",
    "quid": "443",
    "cityname": "泗水县"
}, {"pid": "10", "cid": "318", "quid": "541", "cityname": "兖州市"}, {
    "pid": "10",
    "cid": "479",
    "quid": "833",
    "cityname": "荣成市"
}, {"pid": "10", "cid": "1370", "quid": "888", "cityname": "禹城市"}, {
    "pid": "10",
    "cid": "318",
    "quid": "889",
    "cityname": "邹城市"
}, {"pid": "10", "cid": "614", "quid": "909", "cityname": "滕州市"}, {
    "pid": "10",
    "cid": "533",
    "quid": "1037",
    "cityname": "海阳市"
}, {"pid": "10", "cid": "533", "quid": "1038", "cityname": "莱阳市"}, {
    "pid": "10",
    "cid": "475",
    "quid": "1040",
    "cityname": "高密市"
}, {"pid": "10", "cid": "542", "quid": "1041", "cityname": "临淄"}, {
    "pid": "10",
    "cid": "7",
    "quid": "1043",
    "cityname": "胶州市"
}, {"pid": "10", "cid": "475", "quid": "1044", "cityname": "青州市"}, {
    "pid": "10",
    "cid": "318",
    "quid": "1073",
    "cityname": "梁山县"
}, {"pid": "10", "cid": "1074", "quid": "1322", "cityname": "东明县"}, {
    "pid": "10",
    "cid": "542",
    "quid": "1338",
    "cityname": "博山"
}, {"pid": "10", "cid": "533", "quid": "1568", "cityname": "长岛县"}, {
    "pid": "10",
    "cid": "475",
    "quid": "1782",
    "cityname": "临朐县"
}, {"pid": "10", "cid": "475", "quid": "1783", "cityname": "昌邑市"}, {
    "pid": "10",
    "cid": "1074",
    "quid": "1983",
    "cityname": "曹县"
}, {"pid": "10", "cid": "144", "quid": "2842", "cityname": "章丘市"}, {
    "pid": "10",
    "cid": "144",
    "quid": "2843",
    "cityname": "平阴县"
}, {"pid": "10", "cid": "144", "quid": "2844", "cityname": "济阳县"}, {
    "pid": "10",
    "cid": "144",
    "quid": "2845",
    "cityname": "商河县"
}, {"pid": "10", "cid": "7", "quid": "2846", "cityname": "胶南市"}, {
    "pid": "10",
    "cid": "7",
    "quid": "2847",
    "cityname": "平度市"
}, {"pid": "10", "cid": "7", "quid": "2848", "cityname": "莱西市"}, {
    "pid": "10",
    "cid": "7",
    "quid": "2849",
    "cityname": "即墨市"
}, {"pid": "10", "cid": "542", "quid": "2850", "cityname": "桓台县"}, {
    "pid": "10",
    "cid": "542",
    "quid": "2851",
    "cityname": "高青县"
}, {"pid": "10", "cid": "542", "quid": "2852", "cityname": "沂源县"}, {
    "pid": "10",
    "cid": "236",
    "quid": "2853",
    "cityname": "垦利县"
}, {"pid": "10", "cid": "236", "quid": "2854", "cityname": "广饶县"}, {
    "pid": "10",
    "cid": "236",
    "quid": "2855",
    "cityname": "利津县"
}, {"pid": "10", "cid": "475", "quid": "2856", "cityname": "诸城市"}, {
    "pid": "10",
    "cid": "475",
    "quid": "2857",
    "cityname": "寿光市"
}, {"pid": "10", "cid": "475", "quid": "2858", "cityname": "安丘市"}, {
    "pid": "10",
    "cid": "475",
    "quid": "2859",
    "cityname": "昌乐县"
}, {"pid": "10", "cid": "533", "quid": "2860", "cityname": "龙口市"}, {
    "pid": "10",
    "cid": "533",
    "quid": "2861",
    "cityname": "莱州市"
}, {"pid": "10", "cid": "533", "quid": "2862", "cityname": "招远市"}, {
    "pid": "10",
    "cid": "533",
    "quid": "2863",
    "cityname": "栖霞市"
}, {"pid": "10", "cid": "479", "quid": "2864", "cityname": "乳山市"}, {
    "pid": "10",
    "cid": "479",
    "quid": "2865",
    "cityname": "文登市"
}, {"pid": "10", "cid": "318", "quid": "2866", "cityname": "鱼台县"}, {
    "pid": "10",
    "cid": "318",
    "quid": "2867",
    "cityname": "金乡县"
}, {"pid": "10", "cid": "318", "quid": "2868", "cityname": "嘉祥县"}, {
    "pid": "10",
    "cid": "318",
    "quid": "2869",
    "cityname": "微山县"
}, {"pid": "10", "cid": "318", "quid": "2870", "cityname": "汶上县"}, {
    "pid": "10",
    "cid": "454",
    "quid": "2871",
    "cityname": "新泰市"
}, {"pid": "10", "cid": "454", "quid": "2872", "cityname": "肥城市"}, {
    "pid": "10",
    "cid": "454",
    "quid": "2873",
    "cityname": "宁阳县"
}, {"pid": "10", "cid": "454", "quid": "2874", "cityname": "东平县"}, {
    "pid": "10",
    "cid": "1106",
    "quid": "2875",
    "cityname": "五莲县"
}, {"pid": "10", "cid": "1106", "quid": "2876", "cityname": "莒县"}, {
    "pid": "10",
    "cid": "1370",
    "quid": "2877",
    "cityname": "乐陵市"
}, {"pid": "10", "cid": "1370", "quid": "2878", "cityname": "陵县"}, {
    "pid": "10",
    "cid": "1370",
    "quid": "2879",
    "cityname": "宁津县"
}, {"pid": "10", "cid": "1370", "quid": "2880", "cityname": "武城县"}, {
    "pid": "10",
    "cid": "1370",
    "quid": "2881",
    "cityname": "庆云县"
}, {"pid": "10", "cid": "1370", "quid": "2882", "cityname": "平原县"}, {
    "pid": "10",
    "cid": "1370",
    "quid": "2883",
    "cityname": "夏津县"
}, {"pid": "10", "cid": "1370", "quid": "2884", "cityname": "临邑县"}, {
    "pid": "10",
    "cid": "569",
    "quid": "2885",
    "cityname": "沂南县"
}, {"pid": "10", "cid": "569", "quid": "2886", "cityname": "郯城县"}, {
    "pid": "10",
    "cid": "569",
    "quid": "2887",
    "cityname": "沂水县"
}, {"pid": "10", "cid": "569", "quid": "2888", "cityname": "苍山县"}, {
    "pid": "10",
    "cid": "569",
    "quid": "2889",
    "cityname": "费县"
}, {"pid": "10", "cid": "569", "quid": "2890", "cityname": "平邑县"}, {
    "pid": "10",
    "cid": "569",
    "quid": "2891",
    "cityname": "莒南县"
}, {"pid": "10", "cid": "569", "quid": "2892", "cityname": "蒙阴县"}, {
    "pid": "10",
    "cid": "569",
    "quid": "2893",
    "cityname": "临沭县"
}, {"pid": "10", "cid": "1071", "quid": "2894", "cityname": "临清市"}, {
    "pid": "10",
    "cid": "1071",
    "quid": "2895",
    "cityname": "高唐县"
}, {"pid": "10", "cid": "1071", "quid": "2896", "cityname": "阳谷县"}, {
    "pid": "10",
    "cid": "1071",
    "quid": "2897",
    "cityname": "茌平县"
}, {"pid": "10", "cid": "1071", "quid": "2898", "cityname": "莘县"}, {
    "pid": "10",
    "cid": "1071",
    "quid": "2899",
    "cityname": "东阿县"
}, {"pid": "10", "cid": "1071", "quid": "2900", "cityname": "冠县"}, {
    "pid": "10",
    "cid": "2904",
    "quid": "2901",
    "cityname": "邹平县"
}, {"pid": "10", "cid": "2904", "quid": "2902", "cityname": "沾化县"}, {
    "pid": "10",
    "cid": "2904",
    "quid": "2903",
    "cityname": "惠民县"
}, {"pid": "10", "cid": "2904", "quid": "2905", "cityname": "博兴县"}, {
    "pid": "10",
    "cid": "2904",
    "quid": "2906",
    "cityname": "阳信县"
}, {"pid": "10", "cid": "2904", "quid": "2907", "cityname": "无棣县"}, {
    "pid": "10",
    "cid": "1074",
    "quid": "2908",
    "cityname": "鄄城县"
}, {"pid": "10", "cid": "1074", "quid": "2909", "cityname": "单县"}, {
    "pid": "10",
    "cid": "1074",
    "quid": "2910",
    "cityname": "郓城县"
}, {"pid": "10", "cid": "1074", "quid": "2911", "cityname": "定陶县"}, {
    "pid": "10",
    "cid": "1074",
    "quid": "2912",
    "cityname": "巨野县"
}, {"pid": "10", "cid": "1074", "quid": "2913", "cityname": "成武县"}, {
    "pid": "10",
    "cid": "533",
    "quid": "3035",
    "cityname": "牟平"
}, {"pid": "10", "cid": "144", "quid": "10465", "cityname": "市中区"}, {
    "pid": "10",
    "cid": "144",
    "quid": "10466",
    "cityname": "历下区"
}, {"pid": "10", "cid": "144", "quid": "10467", "cityname": "天桥区"}, {
    "pid": "10",
    "cid": "144",
    "quid": "10468",
    "cityname": "槐荫区"
}, {"pid": "10", "cid": "144", "quid": "10469", "cityname": "历城区"}, {
    "pid": "10",
    "cid": "144",
    "quid": "10470",
    "cityname": "长清区"
}, {"pid": "10", "cid": "7", "quid": "10471", "cityname": "市南区"}, {
    "pid": "10",
    "cid": "7",
    "quid": "10472",
    "cityname": "市北区"
}, {"pid": "10", "cid": "7", "quid": "10473", "cityname": "城阳区"}, {
    "pid": "10",
    "cid": "7",
    "quid": "10474",
    "cityname": "四方区"
}, {"pid": "10", "cid": "7", "quid": "10475", "cityname": "李沧区"}, {
    "pid": "10",
    "cid": "7",
    "quid": "10476",
    "cityname": "黄岛区"
}, {"pid": "10", "cid": "7", "quid": "10477", "cityname": "崂山区"}, {
    "pid": "10",
    "cid": "542",
    "quid": "10478",
    "cityname": "张店区"
}, {"pid": "10", "cid": "542", "quid": "10479", "cityname": "临淄区"}, {
    "pid": "10",
    "cid": "542",
    "quid": "10480",
    "cityname": "淄川区"
}, {"pid": "10", "cid": "542", "quid": "10481", "cityname": "博山区"}, {
    "pid": "10",
    "cid": "542",
    "quid": "10482",
    "cityname": "周村区"
}, {"pid": "10", "cid": "614", "quid": "10483", "cityname": "市中区"}, {
    "pid": "10",
    "cid": "614",
    "quid": "10484",
    "cityname": "山亭区"
}, {"pid": "10", "cid": "614", "quid": "10485", "cityname": "峄城区"}, {
    "pid": "10",
    "cid": "614",
    "quid": "10486",
    "cityname": "台儿庄区"
}, {"pid": "10", "cid": "614", "quid": "10487", "cityname": "薛城区"}, {
    "pid": "10",
    "cid": "236",
    "quid": "10488",
    "cityname": "东营区"
}, {"pid": "10", "cid": "236", "quid": "10489", "cityname": "河口区"}, {
    "pid": "10",
    "cid": "475",
    "quid": "10490",
    "cityname": "潍城区"
}, {"pid": "10", "cid": "475", "quid": "10491", "cityname": "寒亭区"}, {
    "pid": "10",
    "cid": "475",
    "quid": "10492",
    "cityname": "坊子区"
}, {"pid": "10", "cid": "475", "quid": "10493", "cityname": "奎文区"}, {
    "pid": "10",
    "cid": "533",
    "quid": "10494",
    "cityname": "芝罘区"
}, {"pid": "10", "cid": "533", "quid": "10495", "cityname": "福山区"}, {
    "pid": "10",
    "cid": "533",
    "quid": "10496",
    "cityname": "牟平区"
}, {"pid": "10", "cid": "533", "quid": "10497", "cityname": "莱山区"}, {
    "pid": "10",
    "cid": "479",
    "quid": "10498",
    "cityname": "环翠区"
}, {"pid": "10", "cid": "318", "quid": "10499", "cityname": "市中区"}, {
    "pid": "10",
    "cid": "318",
    "quid": "10500",
    "cityname": "任城区"
}, {"pid": "10", "cid": "454", "quid": "10501", "cityname": "岱岳区"}, {
    "pid": "10",
    "cid": "1106",
    "quid": "10502",
    "cityname": "东港区"
}, {"pid": "10", "cid": "1106", "quid": "10503", "cityname": "岚山区"}, {
    "pid": "10",
    "cid": "2997",
    "quid": "10504",
    "cityname": "莱城区"
}, {"pid": "10", "cid": "2997", "quid": "10505", "cityname": "钢城区"}, {
    "pid": "10",
    "cid": "1370",
    "quid": "10506",
    "cityname": "德城区"
}, {"pid": "10", "cid": "569", "quid": "10507", "cityname": "兰山区"}, {
    "pid": "10",
    "cid": "569",
    "quid": "10508",
    "cityname": "罗庄区"
}, {"pid": "10", "cid": "569", "quid": "10509", "cityname": "河东区"}, {
    "pid": "10",
    "cid": "1071",
    "quid": "10510",
    "cityname": "东昌府区"
}, {"pid": "10", "cid": "2904", "quid": "10511", "cityname": "滨城区"}, {
    "pid": "10",
    "cid": "1074",
    "quid": "10512",
    "cityname": "牡丹区"
}, {"pid": "10", "cid": "533", "quid": "21832", "cityname": "烟台"}, {
    "pid": "10",
    "cid": "454",
    "quid": "22535",
    "cityname": "泰山区"
}, {"pid": "11", "cid": "1453", "quid": "104", "cityname": "平遥县"}, {
    "pid": "11",
    "cid": "513",
    "quid": "106",
    "cityname": "五台山"
}, {"pid": "11", "cid": "1453", "quid": "133", "cityname": "榆次"}, {
    "pid": "11",
    "cid": "1453",
    "quid": "134",
    "cityname": "灵石县"
}, {"pid": "11", "cid": "1453", "quid": "135", "cityname": "介休市"}, {
    "pid": "11",
    "cid": "136",
    "quid": "557",
    "cityname": "浑源县"
}, {"pid": "11", "cid": "1453", "quid": "908", "cityname": "寿阳县"}, {
    "pid": "11",
    "cid": "139",
    "quid": "1095",
    "cityname": "侯马市"
}, {"pid": "11", "cid": "140", "quid": "1315", "cityname": "永济市"}, {
    "pid": "11",
    "cid": "513",
    "quid": "1316",
    "cityname": "岢岚县"
}, {"pid": "11", "cid": "513", "quid": "1514", "cityname": "代县"}, {
    "pid": "11",
    "cid": "513",
    "quid": "1515",
    "cityname": "宁武县"
}, {"pid": "11", "cid": "2914", "quid": "1520", "cityname": "临县"}, {
    "pid": "11",
    "cid": "1453",
    "quid": "1779",
    "cityname": "左权县"
}, {"pid": "11", "cid": "1453", "quid": "1780", "cityname": "昔阳县"}, {
    "pid": "11",
    "cid": "2914",
    "quid": "1833",
    "cityname": "兴县"
}, {"pid": "11", "cid": "105", "quid": "2915", "cityname": "古交市"}, {
    "pid": "11",
    "cid": "105",
    "quid": "2916",
    "cityname": "阳曲县"
}, {"pid": "11", "cid": "105", "quid": "2917", "cityname": "清徐县"}, {
    "pid": "11",
    "cid": "105",
    "quid": "2918",
    "cityname": "娄烦县"
}, {"pid": "11", "cid": "136", "quid": "2919", "cityname": "大同县"}, {
    "pid": "11",
    "cid": "136",
    "quid": "2920",
    "cityname": "天镇县"
}, {"pid": "11", "cid": "136", "quid": "2921", "cityname": "灵丘县"}, {
    "pid": "11",
    "cid": "136",
    "quid": "2922",
    "cityname": "阳高县"
}, {"pid": "11", "cid": "136", "quid": "2923", "cityname": "左云县"}, {
    "pid": "11",
    "cid": "136",
    "quid": "2924",
    "cityname": "广灵县"
}, {"pid": "11", "cid": "137", "quid": "2926", "cityname": "长治县"}, {
    "pid": "11",
    "cid": "137",
    "quid": "2927",
    "cityname": "长子县"
}, {"pid": "11", "cid": "137", "quid": "2928", "cityname": "平顺县"}, {
    "pid": "11",
    "cid": "137",
    "quid": "2929",
    "cityname": "襄垣县"
}, {"pid": "11", "cid": "137", "quid": "2930", "cityname": "沁源县"}, {
    "pid": "11",
    "cid": "137",
    "quid": "2931",
    "cityname": "屯留县"
}, {"pid": "11", "cid": "137", "quid": "2932", "cityname": "黎城县"}, {
    "pid": "11",
    "cid": "137",
    "quid": "2933",
    "cityname": "武乡县"
}, {"pid": "11", "cid": "137", "quid": "2934", "cityname": "沁县"}, {
    "pid": "11",
    "cid": "137",
    "quid": "2935",
    "cityname": "壶关县"
}, {"pid": "11", "cid": "137", "quid": "2936", "cityname": "潞城市"}, {
    "pid": "11",
    "cid": "1092",
    "quid": "2937",
    "cityname": "高平市"
}, {"pid": "11", "cid": "1092", "quid": "2938", "cityname": "泽州县"}, {
    "pid": "11",
    "cid": "1092",
    "quid": "2939",
    "cityname": "陵川县"
}, {"pid": "11", "cid": "1092", "quid": "2940", "cityname": "阳城县"}, {
    "pid": "11",
    "cid": "1092",
    "quid": "2941",
    "cityname": "沁水县"
}, {"pid": "11", "cid": "1317", "quid": "2945", "cityname": "怀仁县"}, {
    "pid": "11",
    "cid": "1317",
    "quid": "2946",
    "cityname": "应县"
}, {"pid": "11", "cid": "1317", "quid": "2947", "cityname": "右玉县"}, {
    "pid": "11",
    "cid": "1317",
    "quid": "2948",
    "cityname": "山阴县"
}, {"pid": "11", "cid": "2914", "quid": "2996", "cityname": "交城县"}, {
    "pid": "11",
    "cid": "513",
    "quid": "3017",
    "cityname": "五寨县"
}, {"pid": "11", "cid": "513", "quid": "3018", "cityname": "岚县"}, {
    "pid": "11",
    "cid": "513",
    "quid": "3019",
    "cityname": "神池县"
}, {"pid": "11", "cid": "513", "quid": "3020", "cityname": "静乐县"}, {
    "pid": "11",
    "cid": "513",
    "quid": "3021",
    "cityname": "保德县"
}, {"pid": "11", "cid": "513", "quid": "3022", "cityname": "河曲县"}, {
    "pid": "11",
    "cid": "513",
    "quid": "3023",
    "cityname": "偏关县"
}, {"pid": "11", "cid": "139", "quid": "3044", "cityname": "翼城县"}, {
    "pid": "11",
    "cid": "139",
    "quid": "3045",
    "cityname": "霍州市"
}, {"pid": "11", "cid": "139", "quid": "3046", "cityname": "洪洞县"}, {
    "pid": "11",
    "cid": "139",
    "quid": "3047",
    "cityname": "蒲县"
}, {"pid": "11", "cid": "139", "quid": "3048", "cityname": "汾西县"}, {
    "pid": "11",
    "cid": "139",
    "quid": "3049",
    "cityname": "隰县"
}, {"pid": "11", "cid": "139", "quid": "3050", "cityname": "大宁县"}, {
    "pid": "11",
    "cid": "139",
    "quid": "3051",
    "cityname": "永和县"
}, {"pid": "11", "cid": "139", "quid": "3052", "cityname": "吉县"}, {
    "pid": "11",
    "cid": "139",
    "quid": "3053",
    "cityname": "乡宁县"
}, {"pid": "11", "cid": "139", "quid": "3054", "cityname": "古县"}, {
    "pid": "11",
    "cid": "139",
    "quid": "3055",
    "cityname": "安泽县"
}, {"pid": "11", "cid": "140", "quid": "3056", "cityname": "临猗县"}, {
    "pid": "11",
    "cid": "140",
    "quid": "3057",
    "cityname": "芮城县"
}, {"pid": "11", "cid": "140", "quid": "3058", "cityname": "万荣县"}, {
    "pid": "11",
    "cid": "140",
    "quid": "3059",
    "cityname": "河津市"
}, {"pid": "11", "cid": "140", "quid": "3060", "cityname": "稷山县"}, {
    "pid": "11",
    "cid": "140",
    "quid": "3061",
    "cityname": "闻喜县"
}, {"pid": "11", "cid": "140", "quid": "3062", "cityname": "新绛县"}, {
    "pid": "11",
    "cid": "140",
    "quid": "3063",
    "cityname": "夏县"
}, {"pid": "11", "cid": "140", "quid": "3064", "cityname": "平陆县"}, {
    "pid": "11",
    "cid": "140",
    "quid": "3065",
    "cityname": "垣曲县"
}, {"pid": "11", "cid": "140", "quid": "3066", "cityname": "绛县"}, {
    "pid": "11",
    "cid": "907",
    "quid": "3067",
    "cityname": "平定县"
}, {"pid": "11", "cid": "907", "quid": "3068", "cityname": "盂县"}, {
    "pid": "11",
    "cid": "1453",
    "quid": "3069",
    "cityname": "祁县"
}, {"pid": "11", "cid": "1453", "quid": "3070", "cityname": "太谷县"}, {
    "pid": "11",
    "cid": "1453",
    "quid": "3071",
    "cityname": "和顺县"
}, {"pid": "11", "cid": "513", "quid": "3072", "cityname": "原平市"}, {
    "pid": "11",
    "cid": "139",
    "quid": "3211",
    "cityname": "浮山县"
}, {"pid": "11", "cid": "139", "quid": "3212", "cityname": "襄汾县"}, {
    "pid": "11",
    "cid": "139",
    "quid": "3213",
    "cityname": "曲沃县"
}, {"pid": "11", "cid": "513", "quid": "3214", "cityname": "繁峙县"}, {
    "pid": "11",
    "cid": "513",
    "quid": "3215",
    "cityname": "定襄县"
}, {"pid": "11", "cid": "1453", "quid": "3216", "cityname": "榆社县"}, {
    "pid": "11",
    "cid": "2914",
    "quid": "3217",
    "cityname": "孝义市"
}, {"pid": "11", "cid": "2914", "quid": "3218", "cityname": "汾阳市"}, {
    "pid": "11",
    "cid": "2914",
    "quid": "3219",
    "cityname": "文水县"
}, {"pid": "11", "cid": "2914", "quid": "3220", "cityname": "中阳县"}, {
    "pid": "11",
    "cid": "2914",
    "quid": "3221",
    "cityname": "方山县"
}, {"pid": "11", "cid": "2914", "quid": "3222", "cityname": "柳林县"}, {
    "pid": "11",
    "cid": "2914",
    "quid": "3224",
    "cityname": "交口县"
}, {"pid": "11", "cid": "2914", "quid": "3225", "cityname": "石楼县"}, {
    "pid": "11",
    "cid": "2914",
    "quid": "3745",
    "cityname": "离石市"
}, {"pid": "11", "cid": "105", "quid": "10278", "cityname": "杏花岭区"}, {
    "pid": "11",
    "cid": "105",
    "quid": "10279",
    "cityname": "小店区"
}, {"pid": "11", "cid": "105", "quid": "10280", "cityname": "迎泽区"}, {
    "pid": "11",
    "cid": "105",
    "quid": "10281",
    "cityname": "尖草坪区"
}, {"pid": "11", "cid": "105", "quid": "10282", "cityname": "万柏林区"}, {
    "pid": "11",
    "cid": "105",
    "quid": "10283",
    "cityname": "晋源区"
}, {"pid": "11", "cid": "136", "quid": "10284", "cityname": "城区"}, {
    "pid": "11",
    "cid": "136",
    "quid": "10285",
    "cityname": "矿区"
}, {"pid": "11", "cid": "136", "quid": "10286", "cityname": "南郊区"}, {
    "pid": "11",
    "cid": "136",
    "quid": "10287",
    "cityname": "新荣区"
}, {"pid": "11", "cid": "907", "quid": "10288", "cityname": "城区"}, {
    "pid": "11",
    "cid": "907",
    "quid": "10289",
    "cityname": "矿区"
}, {"pid": "11", "cid": "907", "quid": "10290", "cityname": "郊区"}, {
    "pid": "11",
    "cid": "137",
    "quid": "10291",
    "cityname": "城区"
}, {"pid": "11", "cid": "137", "quid": "10292", "cityname": "郊区"}, {
    "pid": "11",
    "cid": "1092",
    "quid": "10293",
    "cityname": "城区"
}, {"pid": "11", "cid": "1317", "quid": "10294", "cityname": "朔城区"}, {
    "pid": "11",
    "cid": "1317",
    "quid": "10295",
    "cityname": "平鲁区"
}, {"pid": "11", "cid": "1453", "quid": "10296", "cityname": "榆次区"}, {
    "pid": "11",
    "cid": "140",
    "quid": "10297",
    "cityname": "盐湖区"
}, {"pid": "11", "cid": "513", "quid": "10298", "cityname": "忻府区"}, {
    "pid": "11",
    "cid": "139",
    "quid": "10299",
    "cityname": "尧都区"
}, {"pid": "11", "cid": "2914", "quid": "10300", "cityname": "离石区"}, {
    "pid": "11",
    "cid": "140",
    "quid": "11818",
    "cityname": "解州镇"
}, {"pid": "12", "cid": "1030", "quid": "117", "cityname": "潼关县"}, {
    "pid": "12",
    "cid": "1030",
    "quid": "119",
    "cityname": "华阴"
}, {"pid": "12", "cid": "2973", "quid": "123", "cityname": "丹凤县"}, {
    "pid": "12",
    "cid": "527",
    "quid": "126",
    "cityname": "佳县"
}, {"pid": "12", "cid": "110", "quid": "127", "cityname": "黄陵县"}, {
    "pid": "12",
    "cid": "1030",
    "quid": "128",
    "cityname": "韩城市"
}, {"pid": "12", "cid": "110", "quid": "130", "cityname": "洛川县"}, {
    "pid": "12",
    "cid": "112",
    "quid": "131",
    "cityname": "岐山县"
}, {"pid": "12", "cid": "171", "quid": "190", "cityname": "白河县"}, {
    "pid": "12",
    "cid": "111",
    "quid": "1022",
    "cityname": "兴平市"
}, {"pid": "12", "cid": "10", "quid": "1031", "cityname": "临潼区"}, {
    "pid": "12",
    "cid": "129",
    "quid": "1055",
    "cityname": "勉县"
}, {"pid": "12", "cid": "129", "quid": "1056", "cityname": "西乡县"}, {
    "pid": "12",
    "cid": "129",
    "quid": "1064",
    "cityname": "略阳县"
}, {"pid": "12", "cid": "171", "quid": "1066", "cityname": "秦岭"}, {
    "pid": "12",
    "cid": "111",
    "quid": "1067",
    "cityname": "武功县"
}, {"pid": "12", "cid": "527", "quid": "1159", "cityname": "清涧县"}, {
    "pid": "12",
    "cid": "129",
    "quid": "1506",
    "cityname": "城固县"
}, {"pid": "12", "cid": "129", "quid": "1507", "cityname": "宁强县"}, {
    "pid": "12",
    "cid": "112",
    "quid": "1527",
    "cityname": "太白县"
}, {"pid": "12", "cid": "111", "quid": "1774", "cityname": "礼泉县"}, {
    "pid": "12",
    "cid": "111",
    "quid": "1775",
    "cityname": "乾县"
}, {"pid": "12", "cid": "111", "quid": "1776", "cityname": "彬县"}, {
    "pid": "12",
    "cid": "111",
    "quid": "1777",
    "cityname": "长武县"
}, {"pid": "12", "cid": "111", "quid": "1778", "cityname": "三原县"}, {
    "pid": "12",
    "cid": "10",
    "quid": "3073",
    "cityname": "高陵县"
}, {"pid": "12", "cid": "10", "quid": "3074", "cityname": "蓝田县"}, {
    "pid": "12",
    "cid": "10",
    "quid": "3075",
    "cityname": "户县"
}, {"pid": "12", "cid": "10", "quid": "3076", "cityname": "周至县"}, {
    "pid": "12",
    "cid": "118",
    "quid": "3077",
    "cityname": "宜君县"
}, {"pid": "12", "cid": "112", "quid": "3078", "cityname": "凤翔县"}, {
    "pid": "12",
    "cid": "112",
    "quid": "3079",
    "cityname": "陇县"
}, {"pid": "12", "cid": "112", "quid": "3080", "cityname": "麟游县"}, {
    "pid": "12",
    "cid": "112",
    "quid": "3081",
    "cityname": "扶风县"
}, {"pid": "12", "cid": "112", "quid": "3082", "cityname": "千阳县"}, {
    "pid": "12",
    "cid": "112",
    "quid": "3083",
    "cityname": "眉县"
}, {"pid": "12", "cid": "112", "quid": "3084", "cityname": "凤县"}, {
    "pid": "12",
    "cid": "111",
    "quid": "3085",
    "cityname": "泾阳县"
}, {"pid": "12", "cid": "111", "quid": "3086", "cityname": "永寿县"}, {
    "pid": "12",
    "cid": "111",
    "quid": "3087",
    "cityname": "旬邑县"
}, {"pid": "12", "cid": "111", "quid": "3088", "cityname": "淳化县"}, {
    "pid": "12",
    "cid": "1030",
    "quid": "3089",
    "cityname": "蒲城县"
}, {"pid": "12", "cid": "1030", "quid": "3090", "cityname": "白水县"}, {
    "pid": "12",
    "cid": "1030",
    "quid": "3091",
    "cityname": "澄城县"
}, {"pid": "12", "cid": "1030", "quid": "3092", "cityname": "华县"}, {
    "pid": "12",
    "cid": "1030",
    "quid": "3093",
    "cityname": "合阳县"
}, {"pid": "12", "cid": "1030", "quid": "3094", "cityname": "富平县"}, {
    "pid": "12",
    "cid": "1030",
    "quid": "3095",
    "cityname": "大荔县"
}, {"pid": "12", "cid": "110", "quid": "3096", "cityname": "安塞县"}, {
    "pid": "12",
    "cid": "110",
    "quid": "3097",
    "cityname": "子长县"
}, {"pid": "12", "cid": "110", "quid": "3098", "cityname": "延川县"}, {
    "pid": "12",
    "cid": "110",
    "quid": "3099",
    "cityname": "富县"
}, {"pid": "12", "cid": "110", "quid": "3100", "cityname": "延长县"}, {
    "pid": "12",
    "cid": "110",
    "quid": "3101",
    "cityname": "甘泉县"
}, {"pid": "12", "cid": "110", "quid": "3102", "cityname": "宜川县"}, {
    "pid": "12",
    "cid": "110",
    "quid": "3103",
    "cityname": "志丹县"
}, {"pid": "12", "cid": "110", "quid": "3104", "cityname": "黄龙县"}, {
    "pid": "12",
    "cid": "110",
    "quid": "3105",
    "cityname": "吴旗县"
}, {"pid": "12", "cid": "129", "quid": "3106", "cityname": "留坝县"}, {
    "pid": "12",
    "cid": "129",
    "quid": "3107",
    "cityname": "镇巴县"
}, {"pid": "12", "cid": "129", "quid": "3108", "cityname": "南郑县"}, {
    "pid": "12",
    "cid": "129",
    "quid": "3109",
    "cityname": "洋县"
}, {"pid": "12", "cid": "129", "quid": "3110", "cityname": "佛坪县"}, {
    "pid": "12",
    "cid": "527",
    "quid": "3111",
    "cityname": "绥德县"
}, {"pid": "12", "cid": "527", "quid": "3112", "cityname": "神木县"}, {
    "pid": "12",
    "cid": "527",
    "quid": "3113",
    "cityname": "府谷县"
}, {"pid": "12", "cid": "527", "quid": "3114", "cityname": "子洲县"}, {
    "pid": "12",
    "cid": "527",
    "quid": "3115",
    "cityname": "靖边县"
}, {"pid": "12", "cid": "527", "quid": "3116", "cityname": "横山县"}, {
    "pid": "12",
    "cid": "527",
    "quid": "3117",
    "cityname": "米脂县"
}, {"pid": "12", "cid": "527", "quid": "3118", "cityname": "吴堡县"}, {
    "pid": "12",
    "cid": "527",
    "quid": "3119",
    "cityname": "定边县"
}, {"pid": "12", "cid": "171", "quid": "3120", "cityname": "紫阳县"}, {
    "pid": "12",
    "cid": "171",
    "quid": "3121",
    "cityname": "岚皋县"
}, {"pid": "12", "cid": "171", "quid": "3122", "cityname": "旬阳县"}, {
    "pid": "12",
    "cid": "171",
    "quid": "3123",
    "cityname": "镇坪县"
}, {"pid": "12", "cid": "171", "quid": "3124", "cityname": "平利县"}, {
    "pid": "12",
    "cid": "171",
    "quid": "3125",
    "cityname": "石泉县"
}, {"pid": "12", "cid": "171", "quid": "3126", "cityname": "宁陕县"}, {
    "pid": "12",
    "cid": "171",
    "quid": "3127",
    "cityname": "汉阴县"
}, {"pid": "12", "cid": "2973", "quid": "3128", "cityname": "镇安县"}, {
    "pid": "12",
    "cid": "2973",
    "quid": "3129",
    "cityname": "山阳县"
}, {"pid": "12", "cid": "2973", "quid": "3130", "cityname": "洛南县"}, {
    "pid": "12",
    "cid": "2973",
    "quid": "3131",
    "cityname": "商南县"
}, {"pid": "12", "cid": "2973", "quid": "3132", "cityname": "柞水县"}, {
    "pid": "12",
    "cid": "10",
    "quid": "9891",
    "cityname": "莲湖区"
}, {"pid": "12", "cid": "10", "quid": "9892", "cityname": "新城区"}, {
    "pid": "12",
    "cid": "10",
    "quid": "9893",
    "cityname": "碑林区"
}, {"pid": "12", "cid": "10", "quid": "9894", "cityname": "雁塔区"}, {
    "pid": "12",
    "cid": "10",
    "quid": "9895",
    "cityname": "灞桥区"
}, {"pid": "12", "cid": "10", "quid": "9896", "cityname": "未央区"}, {
    "pid": "12",
    "cid": "10",
    "quid": "9897",
    "cityname": "阎良区"
}, {"pid": "12", "cid": "10", "quid": "9899", "cityname": "长安区"}, {
    "pid": "12",
    "cid": "118",
    "quid": "9900",
    "cityname": "耀州区"
}, {"pid": "12", "cid": "118", "quid": "9901", "cityname": "王益区"}, {
    "pid": "12",
    "cid": "118",
    "quid": "9902",
    "cityname": "印台区"
}, {"pid": "12", "cid": "112", "quid": "9903", "cityname": "渭滨区"}, {
    "pid": "12",
    "cid": "112",
    "quid": "9904",
    "cityname": "金台区"
}, {"pid": "12", "cid": "112", "quid": "9905", "cityname": "陈仓区(虢镇)"}, {
    "pid": "12",
    "cid": "111",
    "quid": "9906",
    "cityname": "秦都区"
}, {"pid": "12", "cid": "111", "quid": "9907", "cityname": "渭城区"}, {
    "pid": "12",
    "cid": "111",
    "quid": "9908",
    "cityname": "杨陵区"
}, {"pid": "12", "cid": "1030", "quid": "9909", "cityname": "临渭区"}, {
    "pid": "12",
    "cid": "110",
    "quid": "9910",
    "cityname": "宝塔区"
}, {"pid": "12", "cid": "129", "quid": "9911", "cityname": "汉台区"}, {
    "pid": "12",
    "cid": "527",
    "quid": "9912",
    "cityname": "榆阳区"
}, {"pid": "12", "cid": "171", "quid": "9913", "cityname": "汉滨区"}, {
    "pid": "12",
    "cid": "2973",
    "quid": "9914",
    "cityname": "商州区"
}, {"pid": "13", "cid": "662", "quid": "11", "cityname": "敦煌"}, {
    "pid": "13",
    "cid": "662",
    "quid": "284",
    "cityname": "贺兰山"
}, {"pid": "13", "cid": "1570", "quid": "497", "cityname": "夏河县"}, {
    "pid": "13",
    "cid": "464",
    "quid": "904",
    "cityname": "甘谷县"
}, {"pid": "13", "cid": "1021", "quid": "968", "cityname": "陇西县"}, {
    "pid": "13",
    "cid": "464",
    "quid": "1202",
    "cityname": "武山县"
}, {"pid": "13", "cid": "662", "quid": "1326", "cityname": "玉门市"}, {
    "pid": "13",
    "cid": "1570",
    "quid": "1571",
    "cityname": "碌曲县"
}, {"pid": "13", "cid": "1570", "quid": "1572", "cityname": "玛曲县"}, {
    "pid": "13",
    "cid": "1570",
    "quid": "1573",
    "cityname": "临潭县"
}, {"pid": "13", "cid": "1570", "quid": "1574", "cityname": "卓尼县"}, {
    "pid": "13",
    "cid": "1570",
    "quid": "1575",
    "cityname": "迭部县"
}, {"pid": "13", "cid": "663", "quid": "1614", "cityname": "山丹县"}, {
    "pid": "13",
    "cid": "662",
    "quid": "1792",
    "cityname": "安西县"
}, {"pid": "13", "cid": "662", "quid": "1793", "cityname": "阿克塞"}, {
    "pid": "13",
    "cid": "662",
    "quid": "1794",
    "cityname": "肃北"
}, {"pid": "13", "cid": "663", "quid": "1795", "cityname": "肃南"}, {
    "pid": "13",
    "cid": "662",
    "quid": "1796",
    "cityname": "金塔县"
}, {"pid": "13", "cid": "663", "quid": "1797", "cityname": "高台县"}, {
    "pid": "13",
    "cid": "663",
    "quid": "1798",
    "cityname": "临泽县"
}, {"pid": "13", "cid": "663", "quid": "1799", "cityname": "民乐县"}, {
    "pid": "13",
    "cid": "1158",
    "quid": "1800",
    "cityname": "永昌县"
}, {"pid": "13", "cid": "664", "quid": "1801", "cityname": "民勤县"}, {
    "pid": "13",
    "cid": "664",
    "quid": "1802",
    "cityname": "古浪县"
}, {"pid": "13", "cid": "664", "quid": "1803", "cityname": "天祝"}, {
    "pid": "13",
    "cid": "100",
    "quid": "1804",
    "cityname": "永登县"
}, {"pid": "13", "cid": "1808", "quid": "1805", "cityname": "景泰县"}, {
    "pid": "13",
    "cid": "100",
    "quid": "1806",
    "cityname": "皋兰县"
}, {"pid": "13", "cid": "1808", "quid": "1807", "cityname": "靖远县"}, {
    "pid": "13",
    "cid": "1810",
    "quid": "1809",
    "cityname": "永靖县"
}, {"pid": "13", "cid": "1810", "quid": "1811", "cityname": "积石山县"}, {
    "pid": "13",
    "cid": "1948",
    "quid": "1812",
    "cityname": "武都县"
}, {"pid": "13", "cid": "1948", "quid": "1813", "cityname": "文县"}, {
    "pid": "13",
    "cid": "404",
    "quid": "1814",
    "cityname": "华池县"
}, {"pid": "13", "cid": "1948", "quid": "1834", "cityname": "成县"}, {
    "pid": "13",
    "cid": "100",
    "quid": "1949",
    "cityname": "榆中县"
}, {"pid": "13", "cid": "1808", "quid": "1950", "cityname": "会宁县"}, {
    "pid": "13",
    "cid": "464",
    "quid": "1951",
    "cityname": "清水县"
}, {"pid": "13", "cid": "464", "quid": "1952", "cityname": "秦安县"}, {
    "pid": "13",
    "cid": "464",
    "quid": "1953",
    "cityname": "张家川"
}, {"pid": "13", "cid": "388", "quid": "1954", "cityname": "灵台县"}, {
    "pid": "13",
    "cid": "388",
    "quid": "1955",
    "cityname": "静宁县"
}, {"pid": "13", "cid": "388", "quid": "1956", "cityname": "崇信县"}, {
    "pid": "13",
    "cid": "388",
    "quid": "1957",
    "cityname": "华亭县"
}, {"pid": "13", "cid": "388", "quid": "1958", "cityname": "泾川县"}, {
    "pid": "13",
    "cid": "388",
    "quid": "1959",
    "cityname": "庄浪县"
}, {"pid": "13", "cid": "404", "quid": "1960", "cityname": "庆城县"}, {
    "pid": "13",
    "cid": "404",
    "quid": "1961",
    "cityname": "镇原县"
}, {"pid": "13", "cid": "404", "quid": "1962", "cityname": "合水县"}, {
    "pid": "13",
    "cid": "404",
    "quid": "1963",
    "cityname": "环县"
}, {"pid": "13", "cid": "404", "quid": "1964", "cityname": "宁县"}, {
    "pid": "13",
    "cid": "404",
    "quid": "1965",
    "cityname": "正宁县"
}, {"pid": "13", "cid": "1021", "quid": "1966", "cityname": "岷县"}, {
    "pid": "13",
    "cid": "1021",
    "quid": "1967",
    "cityname": "渭源县"
}, {"pid": "13", "cid": "1021", "quid": "1968", "cityname": "通渭县"}, {
    "pid": "13",
    "cid": "1021",
    "quid": "1969",
    "cityname": "漳县"
}, {"pid": "13", "cid": "1021", "quid": "1970", "cityname": "临洮县"}, {
    "pid": "13",
    "cid": "1948",
    "quid": "1971",
    "cityname": "礼县"
}, {"pid": "13", "cid": "1948", "quid": "1972", "cityname": "康县"}, {
    "pid": "13",
    "cid": "1948",
    "quid": "1973",
    "cityname": "徽县"
}, {"pid": "13", "cid": "1948", "quid": "1974", "cityname": "两当县"}, {
    "pid": "13",
    "cid": "1948",
    "quid": "1975",
    "cityname": "宕昌县"
}, {"pid": "13", "cid": "1948", "quid": "1976", "cityname": "西和县"}, {
    "pid": "13",
    "cid": "1810",
    "quid": "1977",
    "cityname": "康乐县"
}, {"pid": "13", "cid": "1810", "quid": "1978", "cityname": "广河县"}, {
    "pid": "13",
    "cid": "1810",
    "quid": "1979",
    "cityname": "和政县"
}, {"pid": "13", "cid": "1810", "quid": "1980", "cityname": "临夏县"}, {
    "pid": "13",
    "cid": "1810",
    "quid": "1981",
    "cityname": "东乡"
}, {"pid": "13", "cid": "1570", "quid": "1982", "cityname": "舟曲县"}, {
    "pid": "13",
    "cid": "100",
    "quid": "9886",
    "cityname": "城关区"
}, {"pid": "13", "cid": "100", "quid": "9887", "cityname": "七里河区"}, {
    "pid": "13",
    "cid": "100",
    "quid": "9888",
    "cityname": "西固区"
}, {"pid": "13", "cid": "100", "quid": "9889", "cityname": "红古区"}, {
    "pid": "13",
    "cid": "100",
    "quid": "9890",
    "cityname": "安宁区"
}, {"pid": "13", "cid": "664", "quid": "11271", "cityname": "凉州区"}, {
    "pid": "13",
    "cid": "1158",
    "quid": "11719",
    "cityname": "金川区"
}, {"pid": "13", "cid": "326", "quid": "22595", "cityname": "嘉峪关市"}, {
    "pid": "13",
    "cid": "326",
    "quid": "22596",
    "cityname": "雄关区"
}, {"pid": "13", "cid": "464", "quid": "22609", "cityname": "麦积区"}, {
    "pid": "13",
    "cid": "464",
    "quid": "22610",
    "cityname": "秦州区"
}, {"pid": "14", "cid": "1644", "quid": "1033", "cityname": "同心县"}, {
    "pid": "14",
    "cid": "1644",
    "quid": "1034",
    "cityname": "青铜峡市"
}, {"pid": "14", "cid": "556", "quid": "1035", "cityname": "中宁县"}, {
    "pid": "14",
    "cid": "1134",
    "quid": "1640",
    "cityname": "平罗县"
}, {"pid": "14", "cid": "99", "quid": "1641", "cityname": "贺兰县"}, {
    "pid": "14",
    "cid": "99",
    "quid": "1642",
    "cityname": "永宁县"
}, {"pid": "14", "cid": "99", "quid": "1643", "cityname": "灵武市"}, {
    "pid": "14",
    "cid": "1644",
    "quid": "1645",
    "cityname": "盐池县"
}, {"pid": "14", "cid": "556", "quid": "1646", "cityname": "海原县"}, {
    "pid": "14",
    "cid": "321",
    "quid": "1647",
    "cityname": "西吉县"
}, {"pid": "14", "cid": "321", "quid": "1648", "cityname": "隆德县"}, {
    "pid": "14",
    "cid": "321",
    "quid": "1649",
    "cityname": "泾源县"
}, {"pid": "14", "cid": "321", "quid": "1650", "cityname": "彭阳县"}, {
    "pid": "14",
    "cid": "1134",
    "quid": "2994",
    "cityname": "惠农"
}, {"pid": "14", "cid": "1134", "quid": "2995", "cityname": "陶乐县"}, {
    "pid": "14",
    "cid": "99",
    "quid": "9859",
    "cityname": "兴庆区"
}, {"pid": "14", "cid": "99", "quid": "9860", "cityname": "金凤区"}, {
    "pid": "14",
    "cid": "99",
    "quid": "9861",
    "cityname": "西夏区"
}, {"pid": "14", "cid": "556", "quid": "9862", "cityname": "沙坡头区"}, {
    "pid": "14",
    "cid": "321",
    "quid": "9863",
    "cityname": "原州区"
}, {"pid": "14", "cid": "1134", "quid": "9864", "cityname": "大武口区"}, {
    "pid": "15",
    "cid": "14",
    "quid": "83",
    "cityname": "昆山市"
}, {"pid": "15", "cid": "16", "quid": "238", "cityname": "丹阳市"}, {
    "pid": "15",
    "cid": "13",
    "quid": "325",
    "cityname": "江阴市"
}, {"pid": "15", "cid": "14", "quid": "481", "cityname": "吴江市"}, {
    "pid": "15",
    "cid": "13",
    "quid": "537",
    "cityname": "宜兴市"
}, {"pid": "15", "cid": "14", "quid": "621", "cityname": "张家港市"}, {
    "pid": "15",
    "cid": "14",
    "quid": "654",
    "cityname": "太仓市"
}, {"pid": "15", "cid": "577", "quid": "696", "cityname": "盱眙县"}, {
    "pid": "15",
    "cid": "82",
    "quid": "697",
    "cityname": "启东市"
}, {"pid": "15", "cid": "353", "quid": "894", "cityname": "东海县"}, {
    "pid": "15",
    "cid": "512",
    "quid": "895",
    "cityname": "新沂市"
}, {"pid": "15", "cid": "512", "quid": "896", "cityname": "邳州市"}, {
    "pid": "15",
    "cid": "15",
    "quid": "1223",
    "cityname": "江都区"
}, {"pid": "15", "cid": "15", "quid": "1224", "cityname": "仪征市"}, {
    "pid": "15",
    "cid": "213",
    "quid": "1358",
    "cityname": "溧阳市"
}, {"pid": "15", "cid": "12", "quid": "1521", "cityname": "高淳县"}, {
    "pid": "15",
    "cid": "12",
    "quid": "1771",
    "cityname": "溧水县"
}, {"pid": "15", "cid": "1200", "quid": "1781", "cityname": "东台市"}, {
    "pid": "15",
    "cid": "213",
    "quid": "1841",
    "cityname": "金坛市"
}, {"pid": "15", "cid": "579", "quid": "1842", "cityname": "靖江市"}, {
    "pid": "15",
    "cid": "512",
    "quid": "2629",
    "cityname": "铜山县"
}, {"pid": "15", "cid": "512", "quid": "2630", "cityname": "睢宁县"}, {
    "pid": "15",
    "cid": "512",
    "quid": "2631",
    "cityname": "沛县"
}, {"pid": "15", "cid": "512", "quid": "2632", "cityname": "丰县"}, {
    "pid": "15",
    "cid": "82",
    "quid": "2633",
    "cityname": "如皋市"
}, {"pid": "15", "cid": "82", "quid": "2634", "cityname": "通州市"}, {
    "pid": "15",
    "cid": "82",
    "quid": "2635",
    "cityname": "海门市"
}, {"pid": "15", "cid": "82", "quid": "2636", "cityname": "海安县"}, {
    "pid": "15",
    "cid": "82",
    "quid": "2637",
    "cityname": "如东县"
}, {"pid": "15", "cid": "353", "quid": "2638", "cityname": "灌云县"}, {
    "pid": "15",
    "cid": "353",
    "quid": "2639",
    "cityname": "赣榆县"
}, {"pid": "15", "cid": "353", "quid": "2640", "cityname": "灌南县"}, {
    "pid": "15",
    "cid": "577",
    "quid": "2641",
    "cityname": "涟水县"
}, {"pid": "15", "cid": "577", "quid": "2642", "cityname": "洪泽县"}, {
    "pid": "15",
    "cid": "577",
    "quid": "2643",
    "cityname": "金湖县"
}, {"pid": "15", "cid": "1200", "quid": "2644", "cityname": "大丰市"}, {
    "pid": "15",
    "cid": "1200",
    "quid": "2645",
    "cityname": "建湖县"
}, {"pid": "15", "cid": "1200", "quid": "2646", "cityname": "响水县"}, {
    "pid": "15",
    "cid": "1200",
    "quid": "2647",
    "cityname": "阜宁县"
}, {"pid": "15", "cid": "1200", "quid": "2648", "cityname": "射阳县"}, {
    "pid": "15",
    "cid": "1200",
    "quid": "2649",
    "cityname": "滨海县"
}, {"pid": "15", "cid": "15", "quid": "2650", "cityname": "高邮市"}, {
    "pid": "15",
    "cid": "15",
    "quid": "2651",
    "cityname": "宝应县"
}, {"pid": "15", "cid": "16", "quid": "2652", "cityname": "扬中市"}, {
    "pid": "15",
    "cid": "16",
    "quid": "2653",
    "cityname": "句容市"
}, {"pid": "15", "cid": "579", "quid": "2654", "cityname": "泰兴市"}, {
    "pid": "15",
    "cid": "579",
    "quid": "2655",
    "cityname": "姜堰市"
}, {"pid": "15", "cid": "579", "quid": "2656", "cityname": "兴化市"}, {
    "pid": "15",
    "cid": "1869",
    "quid": "2657",
    "cityname": "沭阳县"
}, {"pid": "15", "cid": "1869", "quid": "2658", "cityname": "泗阳县"}, {
    "pid": "15",
    "cid": "1869",
    "quid": "2659",
    "cityname": "泗洪县"
}, {"pid": "15", "cid": "1869", "quid": "2660", "cityname": "宿豫县(区)"}, {
    "pid": "15",
    "cid": "213",
    "quid": "3836",
    "cityname": "武进市"
}, {"pid": "15", "cid": "12", "quid": "9953", "cityname": "玄武区"}, {
    "pid": "15",
    "cid": "12",
    "quid": "9954",
    "cityname": "鼓楼区"
}, {"pid": "15", "cid": "12", "quid": "9955", "cityname": "建邺区"}, {
    "pid": "15",
    "cid": "12",
    "quid": "9956",
    "cityname": "白下区"
}, {"pid": "15", "cid": "12", "quid": "9957", "cityname": "秦淮区"}, {
    "pid": "15",
    "cid": "12",
    "quid": "9958",
    "cityname": "下关区"
}, {"pid": "15", "cid": "12", "quid": "9959", "cityname": "雨花区"}, {
    "pid": "15",
    "cid": "12",
    "quid": "9960",
    "cityname": "浦口区"
}, {"pid": "15", "cid": "12", "quid": "9961", "cityname": "栖霞区"}, {
    "pid": "15",
    "cid": "12",
    "quid": "9962",
    "cityname": "江宁区"
}, {"pid": "15", "cid": "12", "quid": "9963", "cityname": "六合区"}, {
    "pid": "15",
    "cid": "13",
    "quid": "9964",
    "cityname": "崇安区"
}, {"pid": "15", "cid": "13", "quid": "9965", "cityname": "北塘区"}, {
    "pid": "15",
    "cid": "13",
    "quid": "9966",
    "cityname": "南长区"
}, {"pid": "15", "cid": "13", "quid": "9967", "cityname": "锡山区"}, {
    "pid": "15",
    "cid": "13",
    "quid": "9968",
    "cityname": "惠山区"
}, {"pid": "15", "cid": "13", "quid": "9969", "cityname": "滨湖区"}, {
    "pid": "15",
    "cid": "512",
    "quid": "9970",
    "cityname": "云龙区"
}, {"pid": "15", "cid": "512", "quid": "9971", "cityname": "鼓楼区"}, {
    "pid": "15",
    "cid": "512",
    "quid": "9972",
    "cityname": "九里区"
}, {"pid": "15", "cid": "512", "quid": "9973", "cityname": "贾汪区"}, {
    "pid": "15",
    "cid": "512",
    "quid": "9974",
    "cityname": "泉山区"
}, {"pid": "15", "cid": "213", "quid": "9975", "cityname": "钟楼区"}, {
    "pid": "15",
    "cid": "213",
    "quid": "9976",
    "cityname": "天宁区"
}, {"pid": "15", "cid": "213", "quid": "9977", "cityname": "新北区"}, {
    "pid": "15",
    "cid": "14",
    "quid": "9978",
    "cityname": "金阊区"
}, {"pid": "15", "cid": "14", "quid": "9979", "cityname": "沧浪区"}, {
    "pid": "15",
    "cid": "14",
    "quid": "9980",
    "cityname": "平江区"
}, {"pid": "15", "cid": "14", "quid": "9981", "cityname": "高新区(虎丘区)"}, {
    "pid": "15",
    "cid": "14",
    "quid": "9982",
    "cityname": "吴中区"
}, {"pid": "15", "cid": "14", "quid": "9983", "cityname": "相城区"}, {
    "pid": "15",
    "cid": "82",
    "quid": "9984",
    "cityname": "崇川区"
}, {"pid": "15", "cid": "82", "quid": "9985", "cityname": "港闸区"}, {
    "pid": "15",
    "cid": "353",
    "quid": "9986",
    "cityname": "新浦区"
}, {"pid": "15", "cid": "353", "quid": "9987", "cityname": "连云区"}, {
    "pid": "15",
    "cid": "353",
    "quid": "9988",
    "cityname": "海州区"
}, {"pid": "15", "cid": "577", "quid": "9989", "cityname": "清河区"}, {
    "pid": "15",
    "cid": "577",
    "quid": "9990",
    "cityname": "清浦区"
}, {"pid": "15", "cid": "577", "quid": "9991", "cityname": "楚州区"}, {
    "pid": "15",
    "cid": "577",
    "quid": "9992",
    "cityname": "淮阴区"
}, {"pid": "15", "cid": "1200", "quid": "9993", "cityname": "亭湖区"}, {
    "pid": "15",
    "cid": "1200",
    "quid": "9994",
    "cityname": "盐都区"
}, {"pid": "15", "cid": "15", "quid": "9995", "cityname": "广陵区"}, {
    "pid": "15",
    "cid": "15",
    "quid": "9997",
    "cityname": "邗江区"
}, {"pid": "15", "cid": "16", "quid": "9998", "cityname": "京口区"}, {
    "pid": "15",
    "cid": "16",
    "quid": "9999",
    "cityname": "润州区"
}, {"pid": "15", "cid": "16", "quid": "10000", "cityname": "丹徒区"}, {
    "pid": "15",
    "cid": "579",
    "quid": "10001",
    "cityname": "海陵区"
}, {"pid": "15", "cid": "579", "quid": "10002", "cityname": "高港区"}, {
    "pid": "15",
    "cid": "1869",
    "quid": "10003",
    "cityname": "宿城区"
}, {"pid": "15", "cid": "1869", "quid": "10004", "cityname": "宿豫区"}, {
    "pid": "15",
    "cid": "213",
    "quid": "11822",
    "cityname": "戚墅堰区"
}, {"pid": "15", "cid": "353", "quid": "11871", "cityname": "云台区"}, {
    "pid": "15",
    "cid": "13",
    "quid": "21833",
    "cityname": "无锡新区"
}, {"pid": "15", "cid": "96", "quid": "22460", "cityname": "虞山镇"}, {
    "pid": "15",
    "cid": "96",
    "quid": "22461",
    "cityname": "东南开发区"
}, {"pid": "15", "cid": "14", "quid": "22529", "cityname": "常熟市"}, {
    "pid": "15",
    "cid": "14",
    "quid": "22530",
    "cityname": "工业园区"
}, {"pid": "15", "cid": "22598", "quid": "22599", "cityname": "花桥镇"}, {
    "pid": "15",
    "cid": "14",
    "quid": "22600",
    "cityname": "姑苏区"
}, {"pid": "15", "cid": "22598", "quid": "22602", "cityname": "周庄"}, {
    "pid": "16",
    "cid": "17",
    "quid": "20",
    "cityname": "淳安县[千岛湖]"
}, {"pid": "16", "cid": "571", "quid": "84", "cityname": "海宁市"}, {
    "pid": "16",
    "cid": "491",
    "quid": "85",
    "cityname": "永嘉县"
}, {"pid": "16", "cid": "375", "quid": "87", "cityname": "奉化"}, {
    "pid": "16",
    "cid": "17",
    "quid": "90",
    "cityname": "临安市"
}, {"pid": "16", "cid": "19", "quid": "208", "cityname": "嵊泗县"}, {
    "pid": "16",
    "cid": "19",
    "quid": "225",
    "cityname": "定海"
}, {"pid": "16", "cid": "17", "quid": "256", "cityname": "富阳市"}, {
    "pid": "16",
    "cid": "578",
    "quid": "296",
    "cityname": "黄岩"
}, {"pid": "16", "cid": "578", "quid": "311", "cityname": "椒江"}, {
    "pid": "16",
    "cid": "491",
    "quid": "408",
    "cityname": "瑞安市"
}, {"pid": "16", "cid": "17", "quid": "460", "cityname": "桐庐县"}, {
    "pid": "16",
    "cid": "578",
    "quid": "470",
    "cityname": "天台县"
}, {"pid": "16", "cid": "17", "quid": "503", "cityname": "萧山区"}, {
    "pid": "16",
    "cid": "308",
    "quid": "536",
    "cityname": "义乌市"
}, {"pid": "16", "cid": "375", "quid": "540", "cityname": "余姚市"}, {
    "pid": "16",
    "cid": "375",
    "quid": "546",
    "cityname": "镇海"
}, {"pid": "16", "cid": "22", "quid": "548", "cityname": "诸暨市"}, {
    "pid": "16",
    "cid": "571",
    "quid": "580",
    "cityname": "桐乡市(乌镇景区)"
}, {"pid": "16", "cid": "571", "quid": "582", "cityname": "海盐县"}, {
    "pid": "16",
    "cid": "22",
    "quid": "595",
    "cityname": "上虞市"
}, {"pid": "16", "cid": "571", "quid": "596", "cityname": "嘉善县"}, {
    "pid": "16",
    "cid": "308",
    "quid": "597",
    "cityname": "兰溪市"
}, {"pid": "16", "cid": "578", "quid": "619", "cityname": "温岭市"}, {
    "pid": "16",
    "cid": "346",
    "quid": "652",
    "cityname": "缙云县"
}, {"pid": "16", "cid": "19", "quid": "655", "cityname": "朱家尖"}, {
    "pid": "16",
    "cid": "17",
    "quid": "658",
    "cityname": "建德市"
}, {"pid": "16", "cid": "86", "quid": "659", "cityname": "安吉县"}, {
    "pid": "16",
    "cid": "491",
    "quid": "732",
    "cityname": "乐清市"
}, {"pid": "16", "cid": "308", "quid": "755", "cityname": "东阳市"}, {
    "pid": "16",
    "cid": "578",
    "quid": "868",
    "cityname": "仙居县"
}, {"pid": "16", "cid": "22", "quid": "872", "cityname": "新昌县"}, {
    "pid": "16",
    "cid": "308",
    "quid": "929",
    "cityname": "浦江县"
}, {"pid": "16", "cid": "308", "quid": "959", "cityname": "武义县"}, {
    "pid": "16",
    "cid": "308",
    "quid": "960",
    "cityname": "永康市"
}, {"pid": "16", "cid": "346", "quid": "961", "cityname": "青田县"}, {
    "pid": "16",
    "cid": "407",
    "quid": "973",
    "cityname": "龙游县"
}, {"pid": "16", "cid": "407", "quid": "1000", "cityname": "江山"}, {
    "pid": "16",
    "cid": "86",
    "quid": "1107",
    "cityname": "长兴县"
}, {"pid": "16", "cid": "375", "quid": "1201", "cityname": "宁海县"}, {
    "pid": "16",
    "cid": "571",
    "quid": "1206",
    "cityname": "平湖市"
}, {"pid": "16", "cid": "375", "quid": "1208", "cityname": "慈溪市"}, {
    "pid": "16",
    "cid": "578",
    "quid": "1209",
    "cityname": "临海市"
}, {"pid": "16", "cid": "22", "quid": "1212", "cityname": "嵊州市"}, {
    "pid": "16",
    "cid": "86",
    "quid": "1367",
    "cityname": "德清县"
}, {"pid": "16", "cid": "491", "quid": "1443", "cityname": "泰顺县"}, {
    "pid": "16",
    "cid": "407",
    "quid": "1488",
    "cityname": "常山县"
}, {"pid": "16", "cid": "17", "quid": "1558", "cityname": "余杭区"}, {
    "pid": "16",
    "cid": "346",
    "quid": "1563",
    "cityname": "景宁"
}, {"pid": "16", "cid": "407", "quid": "1564", "cityname": "开化县"}, {
    "pid": "16",
    "cid": "19",
    "quid": "1566",
    "cityname": "岱山县"
}, {"pid": "16", "cid": "346", "quid": "1576", "cityname": "松阳县"}, {
    "pid": "16",
    "cid": "346",
    "quid": "1832",
    "cityname": "庆元县"
}, {"pid": "16", "cid": "346", "quid": "2661", "cityname": "云和县"}, {
    "pid": "16",
    "cid": "346",
    "quid": "2662",
    "cityname": "遂昌县"
}, {"pid": "16", "cid": "346", "quid": "2663", "cityname": "龙泉市"}, {
    "pid": "16",
    "cid": "578",
    "quid": "2664",
    "cityname": "三门县"
}, {"pid": "16", "cid": "578", "quid": "2665", "cityname": "玉环县"}, {
    "pid": "16",
    "cid": "308",
    "quid": "2666",
    "cityname": "磐安县"
}, {"pid": "16", "cid": "491", "quid": "2667", "cityname": "洞头县"}, {
    "pid": "16",
    "cid": "491",
    "quid": "2668",
    "cityname": "平阳县"
}, {"pid": "16", "cid": "491", "quid": "2669", "cityname": "苍南县"}, {
    "pid": "16",
    "cid": "491",
    "quid": "2670",
    "cityname": "文成县"
}, {"pid": "16", "cid": "375", "quid": "3249", "cityname": "象山县"}, {
    "pid": "16",
    "cid": "17",
    "quid": "10005",
    "cityname": "拱墅区"
}, {"pid": "16", "cid": "17", "quid": "10006", "cityname": "西湖区"}, {
    "pid": "16",
    "cid": "17",
    "quid": "10007",
    "cityname": "上城区"
}, {"pid": "16", "cid": "17", "quid": "10008", "cityname": "下城区"}, {
    "pid": "16",
    "cid": "17",
    "quid": "10009",
    "cityname": "江干区"
}, {"pid": "16", "cid": "17", "quid": "10010", "cityname": "滨江区"}, {
    "pid": "16",
    "cid": "375",
    "quid": "10011",
    "cityname": "海曙区"
}, {"pid": "16", "cid": "375", "quid": "10012", "cityname": "江东区"}, {
    "pid": "16",
    "cid": "375",
    "quid": "10013",
    "cityname": "江北区"
}, {"pid": "16", "cid": "375", "quid": "10014", "cityname": "北仑区"}, {
    "pid": "16",
    "cid": "491",
    "quid": "10015",
    "cityname": "鹿城区"
}, {"pid": "16", "cid": "491", "quid": "10016", "cityname": "龙湾区"}, {
    "pid": "16",
    "cid": "491",
    "quid": "10017",
    "cityname": "瓯海区"
}, {"pid": "16", "cid": "571", "quid": "10019", "cityname": "秀洲区"}, {
    "pid": "16",
    "cid": "86",
    "quid": "10020",
    "cityname": "吴兴区"
}, {"pid": "16", "cid": "86", "quid": "10021", "cityname": "南浔区"}, {
    "pid": "16",
    "cid": "22",
    "quid": "10022",
    "cityname": "越城区"
}, {"pid": "16", "cid": "308", "quid": "10023", "cityname": "婺城区"}, {
    "pid": "16",
    "cid": "308",
    "quid": "10024",
    "cityname": "金东区"
}, {"pid": "16", "cid": "407", "quid": "10025", "cityname": "柯城区"}, {
    "pid": "16",
    "cid": "407",
    "quid": "10026",
    "cityname": "衢江区"
}, {"pid": "16", "cid": "19", "quid": "10027", "cityname": "定海区"}, {
    "pid": "16",
    "cid": "19",
    "quid": "10028",
    "cityname": "普陀区"
}, {"pid": "16", "cid": "578", "quid": "10029", "cityname": "椒江区"}, {
    "pid": "16",
    "cid": "578",
    "quid": "10030",
    "cityname": "黄岩区"
}, {"pid": "16", "cid": "578", "quid": "10031", "cityname": "路桥区"}, {
    "pid": "16",
    "cid": "346",
    "quid": "10032",
    "cityname": "莲都区"
}, {"pid": "16", "cid": "346", "quid": "10994", "cityname": "碧湖镇"}, {
    "pid": "16",
    "cid": "346",
    "quid": "10995",
    "cityname": "大港头镇"
}, {"pid": "16", "cid": "346", "quid": "10996", "cityname": "老竹畲族镇"}, {
    "pid": "16",
    "cid": "346",
    "quid": "10997",
    "cityname": "巨溪乡"
}, {"pid": "16", "cid": "346", "quid": "10998", "cityname": "双溪镇"}, {
    "pid": "16",
    "cid": "375",
    "quid": "12022",
    "cityname": "鄞州区"
}, {"pid": "16", "cid": "571", "quid": "22463", "cityname": "南湖区"}, {
    "pid": "16",
    "cid": "571",
    "quid": "22531",
    "cityname": "嘉兴港区"
}, {"pid": "16", "cid": "571", "quid": "22532", "cityname": "嘉兴经济技术开发区"}, {
    "pid": "16",
    "cid": "22",
    "quid": "22534",
    "cityname": "绍兴县"
}, {"pid": "16", "cid": "22572", "quid": "22573", "cityname": "濮院镇"}, {
    "pid": "17",
    "cid": "1006",
    "quid": "209",
    "cityname": "广德县"
}, {"pid": "17", "cid": "23", "quid": "403", "cityname": "黟县"}, {
    "pid": "17",
    "cid": "23",
    "quid": "508",
    "cityname": "歙县"
}, {"pid": "17", "cid": "218", "quid": "583", "cityname": "九华山"}, {
    "pid": "17",
    "cid": "218",
    "quid": "590",
    "cityname": "贵池区"
}, {"pid": "17", "cid": "521", "quid": "890", "cityname": "符离集"}, {
    "pid": "17",
    "cid": "182",
    "quid": "891",
    "cityname": "固镇县"
}, {"pid": "17", "cid": "214", "quid": "892", "cityname": "明光市"}, {
    "pid": "17",
    "cid": "589",
    "quid": "893",
    "cityname": "庐江县"
}, {"pid": "17", "cid": "521", "quid": "900", "cityname": "砀山县"}, {
    "pid": "17",
    "cid": "177",
    "quid": "944",
    "cityname": "桐城市"
}, {"pid": "17", "cid": "177", "quid": "945", "cityname": "天柱山"}, {
    "pid": "17",
    "cid": "177",
    "quid": "946",
    "cityname": "太湖县"
}, {"pid": "17", "cid": "177", "quid": "948", "cityname": "宿松县"}, {
    "pid": "17",
    "cid": "1006",
    "quid": "1005",
    "cityname": "宁国市"
}, {"pid": "17", "cid": "1024", "quid": "1007", "cityname": "当涂县"}, {
    "pid": "17",
    "cid": "1006",
    "quid": "1008",
    "cityname": "绩溪县"
}, {"pid": "17", "cid": "278", "quid": "1009", "cityname": "长丰县"}, {
    "pid": "17",
    "cid": "214",
    "quid": "1010",
    "cityname": "凤阳县"
}, {"pid": "17", "cid": "478", "quid": "1016", "cityname": "繁昌县"}, {
    "pid": "17",
    "cid": "23",
    "quid": "1026",
    "cityname": "祁门县"
}, {"pid": "17", "cid": "1870", "quid": "1082", "cityname": "舒城县"}, {
    "pid": "17",
    "cid": "257",
    "quid": "1085",
    "cityname": "颍上县"
}, {"pid": "17", "cid": "257", "quid": "1086", "cityname": "青龙山"}, {
    "pid": "17",
    "cid": "272",
    "quid": "1087",
    "cityname": "濉溪县"
}, {"pid": "17", "cid": "214", "quid": "1477", "cityname": "全椒县"}, {
    "pid": "17",
    "cid": "1870",
    "quid": "1493",
    "cityname": "金寨县"
}, {"pid": "17", "cid": "218", "quid": "1524", "cityname": "石台县"}, {
    "pid": "17",
    "cid": "278",
    "quid": "1871",
    "cityname": "肥东县"
}, {"pid": "17", "cid": "278", "quid": "1872", "cityname": "肥西县"}, {
    "pid": "17",
    "cid": "478",
    "quid": "1873",
    "cityname": "芜湖县"
}, {"pid": "17", "cid": "478", "quid": "1874", "cityname": "南陵县"}, {
    "pid": "17",
    "cid": "182",
    "quid": "1875",
    "cityname": "怀远县"
}, {"pid": "17", "cid": "182", "quid": "1876", "cityname": "五河县"}, {
    "pid": "17",
    "cid": "1452",
    "quid": "1877",
    "cityname": "凤台县"
}, {"pid": "17", "cid": "459", "quid": "1878", "cityname": "铜陵县"}, {
    "pid": "17",
    "cid": "177",
    "quid": "1879",
    "cityname": "枞阳县"
}, {"pid": "17", "cid": "177", "quid": "1880", "cityname": "怀宁县"}, {
    "pid": "17",
    "cid": "177",
    "quid": "1881",
    "cityname": "岳西县"
}, {"pid": "17", "cid": "177", "quid": "1882", "cityname": "望江县"}, {
    "pid": "17",
    "cid": "177",
    "quid": "1883",
    "cityname": "潜山县"
}, {"pid": "17", "cid": "23", "quid": "1884", "cityname": "休宁县"}, {
    "pid": "17",
    "cid": "214",
    "quid": "1885",
    "cityname": "天长市"
}, {"pid": "17", "cid": "214", "quid": "1886", "cityname": "来安县"}, {
    "pid": "17",
    "cid": "214",
    "quid": "1887",
    "cityname": "定远县"
}, {"pid": "17", "cid": "257", "quid": "1888", "cityname": "界首市"}, {
    "pid": "17",
    "cid": "257",
    "quid": "1889",
    "cityname": "临泉县"
}, {"pid": "17", "cid": "257", "quid": "1890", "cityname": "阜南县"}, {
    "pid": "17",
    "cid": "257",
    "quid": "1891",
    "cityname": "太和县"
}, {"pid": "17", "cid": "521", "quid": "1892", "cityname": "萧县"}, {
    "pid": "17",
    "cid": "521",
    "quid": "1893",
    "cityname": "泗县"
}, {"pid": "17", "cid": "521", "quid": "1894", "cityname": "灵璧县"}, {
    "pid": "17",
    "cid": "589",
    "quid": "1895",
    "cityname": "含山县"
}, {"pid": "17", "cid": "589", "quid": "1896", "cityname": "无为县"}, {
    "pid": "17",
    "cid": "589",
    "quid": "1897",
    "cityname": "和县"
}, {"pid": "17", "cid": "1870", "quid": "1898", "cityname": "寿县"}, {
    "pid": "17",
    "cid": "1870",
    "quid": "1899",
    "cityname": "霍山县"
}, {"pid": "17", "cid": "1870", "quid": "1900", "cityname": "霍邱县"}, {
    "pid": "17",
    "cid": "1078",
    "quid": "1901",
    "cityname": "利辛县"
}, {"pid": "17", "cid": "1078", "quid": "1902", "cityname": "涡阳县"}, {
    "pid": "17",
    "cid": "1078",
    "quid": "1903",
    "cityname": "蒙城县"
}, {"pid": "17", "cid": "218", "quid": "1904", "cityname": "东至县"}, {
    "pid": "17",
    "cid": "218",
    "quid": "1905",
    "cityname": "青阳县"
}, {"pid": "17", "cid": "1006", "quid": "1906", "cityname": "郎溪县"}, {
    "pid": "17",
    "cid": "1006",
    "quid": "1907",
    "cityname": "泾县"
}, {"pid": "17", "cid": "1006", "quid": "1908", "cityname": "旌德县"}, {
    "pid": "17",
    "cid": "278",
    "quid": "10608",
    "cityname": "庐阳区"
}, {"pid": "17", "cid": "278", "quid": "10609", "cityname": "瑶海区"}, {
    "pid": "17",
    "cid": "278",
    "quid": "10610",
    "cityname": "蜀山区"
}, {"pid": "17", "cid": "278", "quid": "10611", "cityname": "包河区"}, {
    "pid": "17",
    "cid": "478",
    "quid": "10612",
    "cityname": "镜湖区"
}, {"pid": "17", "cid": "478", "quid": "10613", "cityname": "新芜区"}, {
    "pid": "17",
    "cid": "478",
    "quid": "10614",
    "cityname": "马塘区"
}, {"pid": "17", "cid": "478", "quid": "10615", "cityname": "鸠江区"}, {
    "pid": "17",
    "cid": "182",
    "quid": "10616",
    "cityname": "蚌山区"
}, {"pid": "17", "cid": "182", "quid": "10617", "cityname": "龙子湖区"}, {
    "pid": "17",
    "cid": "182",
    "quid": "10618",
    "cityname": "禹会区"
}, {"pid": "17", "cid": "182", "quid": "10619", "cityname": "淮上区"}, {
    "pid": "17",
    "cid": "1452",
    "quid": "10620",
    "cityname": "田家庵区"
}, {"pid": "17", "cid": "1452", "quid": "10621", "cityname": "大通区"}, {
    "pid": "17",
    "cid": "1452",
    "quid": "10622",
    "cityname": "谢家集区"
}, {"pid": "17", "cid": "1452", "quid": "10623", "cityname": "八公山区"}, {
    "pid": "17",
    "cid": "1452",
    "quid": "10624",
    "cityname": "潘集区"
}, {"pid": "17", "cid": "1024", "quid": "10625", "cityname": "雨山区"}, {
    "pid": "17",
    "cid": "1024",
    "quid": "10626",
    "cityname": "花山区"
}, {"pid": "17", "cid": "1024", "quid": "10627", "cityname": "金家庄区"}, {
    "pid": "17",
    "cid": "272",
    "quid": "10628",
    "cityname": "相山区"
}, {"pid": "17", "cid": "272", "quid": "10629", "cityname": "杜集区"}, {
    "pid": "17",
    "cid": "272",
    "quid": "10630",
    "cityname": "烈山区"
}, {"pid": "17", "cid": "459", "quid": "10631", "cityname": "铜官山区"}, {
    "pid": "17",
    "cid": "459",
    "quid": "10632",
    "cityname": "狮子山区"
}, {"pid": "17", "cid": "459", "quid": "10633", "cityname": "郊　区"}, {
    "pid": "17",
    "cid": "177",
    "quid": "10634",
    "cityname": "迎江区"
}, {"pid": "17", "cid": "177", "quid": "10635", "cityname": "大观区"}, {
    "pid": "17",
    "cid": "177",
    "quid": "10636",
    "cityname": "郊　区"
}, {"pid": "17", "cid": "23", "quid": "10637", "cityname": "屯溪区"}, {
    "pid": "17",
    "cid": "23",
    "quid": "10638",
    "cityname": "黄山区"
}, {"pid": "17", "cid": "23", "quid": "10639", "cityname": "徽州区"}, {
    "pid": "17",
    "cid": "214",
    "quid": "10640",
    "cityname": "琅琊区"
}, {"pid": "17", "cid": "214", "quid": "10641", "cityname": "南谯区"}, {
    "pid": "17",
    "cid": "257",
    "quid": "10642",
    "cityname": "颍州区"
}, {"pid": "17", "cid": "257", "quid": "10643", "cityname": "颍东区"}, {
    "pid": "17",
    "cid": "257",
    "quid": "10644",
    "cityname": "颍泉区"
}, {"pid": "17", "cid": "521", "quid": "10645", "cityname": "埇桥区"}, {
    "pid": "17",
    "cid": "589",
    "quid": "10646",
    "cityname": "居巢区"
}, {"pid": "17", "cid": "1870", "quid": "10647", "cityname": "金安区"}, {
    "pid": "17",
    "cid": "1870",
    "quid": "10648",
    "cityname": "裕安区"
}, {"pid": "17", "cid": "1078", "quid": "10649", "cityname": "谯城区"}, {
    "pid": "17",
    "cid": "1006",
    "quid": "10651",
    "cityname": "宣州区"
}, {"pid": "17", "cid": "177", "quid": "12074", "cityname": "宜秀区"}, {
    "pid": "17",
    "cid": "23",
    "quid": "22603",
    "cityname": "黄山风景区"
}, {"pid": "18", "cid": "534", "quid": "265", "cityname": "贵溪市"}, {
    "pid": "18",
    "cid": "933",
    "quid": "307",
    "cityname": "井冈山"
}, {"pid": "18", "cid": "24", "quid": "344", "cityname": "庐山"}, {
    "pid": "18",
    "cid": "411",
    "quid": "489",
    "cityname": "婺源县"
}, {"pid": "18", "cid": "411", "quid": "870", "cityname": "三清山"}, {
    "pid": "18",
    "cid": "933",
    "quid": "932",
    "cityname": "新干县"
}, {"pid": "18", "cid": "268", "quid": "934", "cityname": "兴国县"}, {
    "pid": "18",
    "cid": "268",
    "quid": "935",
    "cityname": "信丰县"
}, {"pid": "18", "cid": "268", "quid": "936", "cityname": "定南县"}, {
    "pid": "18",
    "cid": "24",
    "quid": "942",
    "cityname": "德安县"
}, {"pid": "18", "cid": "24", "quid": "943", "cityname": "永修县"}, {
    "pid": "18",
    "cid": "2811",
    "quid": "977",
    "cityname": "东乡县"
}, {"pid": "18", "cid": "518", "quid": "979", "cityname": "樟树市"}, {
    "pid": "18",
    "cid": "376",
    "quid": "991",
    "cityname": "进贤县"
}, {"pid": "18", "cid": "411", "quid": "1001", "cityname": "玉山县"}, {
    "pid": "18",
    "cid": "411",
    "quid": "1002",
    "cityname": "弋阳县"
}, {"pid": "18", "cid": "518", "quid": "1003", "cityname": "丰城市"}, {
    "pid": "18",
    "cid": "603",
    "quid": "1004",
    "cityname": "分宜县"
}, {"pid": "18", "cid": "411", "quid": "1028", "cityname": "万年县"}, {
    "pid": "18",
    "cid": "305",
    "quid": "1089",
    "cityname": "乐平市"
}, {"pid": "18", "cid": "268", "quid": "1108", "cityname": "龙南县"}, {
    "pid": "18",
    "cid": "268",
    "quid": "1835",
    "cityname": "宁都县"
}, {"pid": "18", "cid": "411", "quid": "1836", "cityname": "横峰县"}, {
    "pid": "18",
    "cid": "268",
    "quid": "1837",
    "cityname": "瑞金市"
}, {"pid": "18", "cid": "933", "quid": "1843", "cityname": "吉安县"}, {
    "pid": "18",
    "cid": "376",
    "quid": "1844",
    "cityname": "安义县"
}, {"pid": "18", "cid": "376", "quid": "1845", "cityname": "新建县"}, {
    "pid": "18",
    "cid": "376",
    "quid": "1846",
    "cityname": "南昌县"
}, {"pid": "18", "cid": "305", "quid": "1847", "cityname": "浮梁县"}, {
    "pid": "18",
    "cid": "395",
    "quid": "1848",
    "cityname": "芦溪县"
}, {"pid": "18", "cid": "395", "quid": "1850", "cityname": "莲花县"}, {
    "pid": "18",
    "cid": "24",
    "quid": "1851",
    "cityname": "九江县"
}, {"pid": "18", "cid": "24", "quid": "1852", "cityname": "瑞昌市"}, {
    "pid": "18",
    "cid": "24",
    "quid": "1853",
    "cityname": "星子县"
}, {"pid": "18", "cid": "24", "quid": "1854", "cityname": "都昌县"}, {
    "pid": "18",
    "cid": "24",
    "quid": "1855",
    "cityname": "武宁县"
}, {"pid": "18", "cid": "24", "quid": "1856", "cityname": "彭泽县"}, {
    "pid": "18",
    "cid": "24",
    "quid": "1857",
    "cityname": "湖口县"
}, {"pid": "18", "cid": "24", "quid": "1858", "cityname": "修水县"}, {
    "pid": "18",
    "cid": "534",
    "quid": "1859",
    "cityname": "余江县"
}, {"pid": "18", "cid": "268", "quid": "1861", "cityname": "南康市"}, {
    "pid": "18",
    "cid": "268",
    "quid": "1862",
    "cityname": "赣县"
}, {"pid": "18", "cid": "268", "quid": "1863", "cityname": "石城县"}, {
    "pid": "18",
    "cid": "268",
    "quid": "1864",
    "cityname": "安远县"
}, {"pid": "18", "cid": "268", "quid": "1865", "cityname": "寻乌县"}, {
    "pid": "18",
    "cid": "268",
    "quid": "1866",
    "cityname": "全南县"
}, {"pid": "18", "cid": "268", "quid": "1867", "cityname": "于都县"}, {
    "pid": "18",
    "cid": "395",
    "quid": "1868",
    "cityname": "上栗县"
}, {"pid": "18", "cid": "933", "quid": "2812", "cityname": "永丰县"}, {
    "pid": "18",
    "cid": "933",
    "quid": "2813",
    "cityname": "永新县"
}, {"pid": "18", "cid": "933", "quid": "2814", "cityname": "泰和县"}, {
    "pid": "18",
    "cid": "933",
    "quid": "2815",
    "cityname": "峡江县"
}, {"pid": "18", "cid": "933", "quid": "2816", "cityname": "遂川县"}, {
    "pid": "18",
    "cid": "933",
    "quid": "2817",
    "cityname": "安福县"
}, {"pid": "18", "cid": "933", "quid": "2818", "cityname": "吉水县"}, {
    "pid": "18",
    "cid": "933",
    "quid": "2819",
    "cityname": "万安县"
}, {"pid": "18", "cid": "518", "quid": "2820", "cityname": "高安市"}, {
    "pid": "18",
    "cid": "518",
    "quid": "2821",
    "cityname": "铜鼓县"
}, {"pid": "18", "cid": "518", "quid": "2822", "cityname": "靖安县"}, {
    "pid": "18",
    "cid": "518",
    "quid": "2823",
    "cityname": "宜丰县"
}, {"pid": "18", "cid": "518", "quid": "2824", "cityname": "奉新县"}, {
    "pid": "18",
    "cid": "518",
    "quid": "2825",
    "cityname": "万载县"
}, {"pid": "18", "cid": "518", "quid": "2826", "cityname": "上高县"}, {
    "pid": "18",
    "cid": "2811",
    "quid": "2827",
    "cityname": "南丰县"
}, {"pid": "18", "cid": "2811", "quid": "2828", "cityname": "乐安县"}, {
    "pid": "18",
    "cid": "2811",
    "quid": "2829",
    "cityname": "金溪县"
}, {"pid": "18", "cid": "2811", "quid": "2830", "cityname": "南城县"}, {
    "pid": "18",
    "cid": "2811",
    "quid": "2831",
    "cityname": "资溪县"
}, {"pid": "18", "cid": "2811", "quid": "2832", "cityname": "宜黄县"}, {
    "pid": "18",
    "cid": "2811",
    "quid": "2833",
    "cityname": "广昌县"
}, {"pid": "18", "cid": "2811", "quid": "2834", "cityname": "黎川县"}, {
    "pid": "18",
    "cid": "2811",
    "quid": "2835",
    "cityname": "崇仁县"
}, {"pid": "18", "cid": "411", "quid": "2836", "cityname": "德兴市"}, {
    "pid": "18",
    "cid": "411",
    "quid": "2837",
    "cityname": "上饶县"
}, {"pid": "18", "cid": "411", "quid": "2838", "cityname": "广丰县"}, {
    "pid": "18",
    "cid": "411",
    "quid": "2839",
    "cityname": "鄱阳县"
}, {"pid": "18", "cid": "411", "quid": "2840", "cityname": "铅山县"}, {
    "pid": "18",
    "cid": "411",
    "quid": "2841",
    "cityname": "余干县"
}, {"pid": "18", "cid": "268", "quid": "3025", "cityname": "上犹县"}, {
    "pid": "18",
    "cid": "268",
    "quid": "3711",
    "cityname": "大余县"
}, {"pid": "18", "cid": "268", "quid": "3927", "cityname": "会昌县"}, {
    "pid": "18",
    "cid": "268",
    "quid": "3928",
    "cityname": "崇义县"
}, {"pid": "18", "cid": "376", "quid": "10563", "cityname": "东湖区"}, {
    "pid": "18",
    "cid": "376",
    "quid": "10564",
    "cityname": "西湖区"
}, {"pid": "18", "cid": "376", "quid": "10565", "cityname": "青云谱区"}, {
    "pid": "18",
    "cid": "376",
    "quid": "10566",
    "cityname": "湾里区"
}, {"pid": "18", "cid": "376", "quid": "10567", "cityname": "青山湖区"}, {
    "pid": "18",
    "cid": "305",
    "quid": "10568",
    "cityname": "珠山区"
}, {"pid": "18", "cid": "305", "quid": "10569", "cityname": "昌江区"}, {
    "pid": "18",
    "cid": "395",
    "quid": "10570",
    "cityname": "安源区"
}, {"pid": "18", "cid": "395", "quid": "10571", "cityname": "湘东区"}, {
    "pid": "18",
    "cid": "603",
    "quid": "10572",
    "cityname": "渝水区"
}, {"pid": "18", "cid": "24", "quid": "10573", "cityname": "浔阳区"}, {
    "pid": "18",
    "cid": "24",
    "quid": "10574",
    "cityname": "庐山区"
}, {"pid": "18", "cid": "534", "quid": "10575", "cityname": "月湖区"}, {
    "pid": "18",
    "cid": "268",
    "quid": "10576",
    "cityname": "章贡区"
}, {"pid": "18", "cid": "933", "quid": "10577", "cityname": "吉州区"}, {
    "pid": "18",
    "cid": "933",
    "quid": "10578",
    "cityname": "青原区"
}, {"pid": "18", "cid": "518", "quid": "10579", "cityname": "袁州区"}, {
    "pid": "18",
    "cid": "2811",
    "quid": "10580",
    "cityname": "临川区"
}, {"pid": "18", "cid": "411", "quid": "10581", "cityname": "信州区"}, {
    "pid": "18",
    "cid": "376",
    "quid": "12024",
    "cityname": "李渡镇"
}, {"pid": "18", "cid": "603", "quid": "17967", "cityname": "渝水区"}, {
    "pid": "18",
    "cid": "603",
    "quid": "17968",
    "cityname": "仙女湖风景名胜区"
}, {"pid": "18", "cid": "603", "quid": "17969", "cityname": "高新技术经济开发区"}, {
    "pid": "18",
    "cid": "603",
    "quid": "17970",
    "cityname": "分宜县"
}, {"pid": "19", "cid": "606", "quid": "26", "cityname": "武夷山"}, {
    "pid": "19",
    "cid": "406",
    "quid": "180",
    "cityname": "安溪县"
}, {"pid": "19", "cid": "258", "quid": "203", "cityname": "长乐市"}, {
    "pid": "19",
    "cid": "378",
    "quid": "246",
    "cityname": "福鼎市"
}, {"pid": "19", "cid": "406", "quid": "270", "cityname": "惠安县"}, {
    "pid": "19",
    "cid": "606",
    "quid": "324",
    "cityname": "建阳市"
}, {"pid": "19", "cid": "560", "quid": "341", "cityname": "龙海市"}, {
    "pid": "19",
    "cid": "667",
    "quid": "372",
    "cityname": "湄州"
}, {"pid": "19", "cid": "406", "quid": "374", "cityname": "南安市"}, {
    "pid": "19",
    "cid": "258",
    "quid": "392",
    "cityname": "平潭县"
}, {"pid": "19", "cid": "406", "quid": "444", "cityname": "石狮市"}, {
    "pid": "19",
    "cid": "606",
    "quid": "448",
    "cityname": "邵武市"
}, {"pid": "19", "cid": "437", "quid": "449", "cityname": "沙县"}, {
    "pid": "19",
    "cid": "437",
    "quid": "485",
    "cityname": "永安市"
}, {"pid": "19", "cid": "348", "quid": "600", "cityname": "漳平市"}, {
    "pid": "19",
    "cid": "606",
    "quid": "993",
    "cityname": "来舟"
}, {"pid": "19", "cid": "560", "quid": "994", "cityname": "郭坑"}, {
    "pid": "19",
    "cid": "606",
    "quid": "995",
    "cityname": "顺昌县"
}, {"pid": "19", "cid": "378", "quid": "996", "cityname": "古田县"}, {
    "pid": "19",
    "cid": "348",
    "quid": "1373",
    "cityname": "连城县"
}, {"pid": "19", "cid": "560", "quid": "1495", "cityname": "南靖县"}, {
    "pid": "19",
    "cid": "560",
    "quid": "1565",
    "cityname": "东山岛[县]"
}, {"pid": "19", "cid": "258", "quid": "1909", "cityname": "福清市"}, {
    "pid": "19",
    "cid": "258",
    "quid": "1910",
    "cityname": "闽侯县"
}, {"pid": "19", "cid": "258", "quid": "1911", "cityname": "闽清县"}, {
    "pid": "19",
    "cid": "258",
    "quid": "1912",
    "cityname": "永泰县"
}, {"pid": "19", "cid": "258", "quid": "1913", "cityname": "连江县"}, {
    "pid": "19",
    "cid": "258",
    "quid": "1914",
    "cityname": "罗源县"
}, {"pid": "19", "cid": "667", "quid": "1915", "cityname": "仙游县"}, {
    "pid": "19",
    "cid": "437",
    "quid": "1916",
    "cityname": "明溪县"
}, {"pid": "19", "cid": "437", "quid": "1917", "cityname": "将乐县"}, {
    "pid": "19",
    "cid": "437",
    "quid": "1918",
    "cityname": "大田县"
}, {"pid": "19", "cid": "437", "quid": "1919", "cityname": "宁化县"}, {
    "pid": "19",
    "cid": "437",
    "quid": "1920",
    "cityname": "建宁县"
}, {"pid": "19", "cid": "437", "quid": "1921", "cityname": "尤溪县"}, {
    "pid": "19",
    "cid": "437",
    "quid": "1922",
    "cityname": "清流县"
}, {"pid": "19", "cid": "437", "quid": "1923", "cityname": "泰宁县"}, {
    "pid": "19",
    "cid": "406",
    "quid": "1924",
    "cityname": "晋江市"
}, {"pid": "19", "cid": "406", "quid": "1925", "cityname": "永春县"}, {
    "pid": "19",
    "cid": "406",
    "quid": "1926",
    "cityname": "德化县"
}, {"pid": "19", "cid": "406", "quid": "1927", "cityname": "金门县"}, {
    "pid": "19",
    "cid": "560",
    "quid": "1928",
    "cityname": "平和县"
}, {"pid": "19", "cid": "560", "quid": "1929", "cityname": "诏安县"}, {
    "pid": "19",
    "cid": "560",
    "quid": "1930",
    "cityname": "漳浦县"
}, {"pid": "19", "cid": "560", "quid": "1931", "cityname": "华安县"}, {
    "pid": "19",
    "cid": "560",
    "quid": "1932",
    "cityname": "长泰县"
}, {"pid": "19", "cid": "560", "quid": "1933", "cityname": "云霄县"}, {
    "pid": "19",
    "cid": "606",
    "quid": "1934",
    "cityname": "建瓯市"
}, {"pid": "19", "cid": "606", "quid": "1935", "cityname": "松溪县"}, {
    "pid": "19",
    "cid": "606",
    "quid": "1936",
    "cityname": "光泽县"
}, {"pid": "19", "cid": "606", "quid": "1937", "cityname": "浦城县"}, {
    "pid": "19",
    "cid": "606",
    "quid": "1938",
    "cityname": "政和县"
}, {"pid": "19", "cid": "348", "quid": "1939", "cityname": "长汀县"}, {
    "pid": "19",
    "cid": "348",
    "quid": "1940",
    "cityname": "武平县"
}, {"pid": "19", "cid": "348", "quid": "1941", "cityname": "上杭县"}, {
    "pid": "19",
    "cid": "348",
    "quid": "1942",
    "cityname": "永定县"
}, {"pid": "19", "cid": "378", "quid": "1943", "cityname": "福安市"}, {
    "pid": "19",
    "cid": "378",
    "quid": "1944",
    "cityname": "霞浦县"
}, {"pid": "19", "cid": "378", "quid": "1945", "cityname": "柘荣县"}, {
    "pid": "19",
    "cid": "378",
    "quid": "1946",
    "cityname": "屏南县"
}, {"pid": "19", "cid": "378", "quid": "1947", "cityname": "周宁县"}, {
    "pid": "19",
    "cid": "25",
    "quid": "2993",
    "cityname": "鼓浪屿"
}, {"pid": "19", "cid": "378", "quid": "3031", "cityname": "寿宁县"}, {
    "pid": "19",
    "cid": "258",
    "quid": "10582",
    "cityname": "鼓楼区"
}, {"pid": "19", "cid": "258", "quid": "10583", "cityname": "台江区"}, {
    "pid": "19",
    "cid": "258",
    "quid": "10584",
    "cityname": "仓山区"
}, {"pid": "19", "cid": "258", "quid": "10585", "cityname": "马尾区"}, {
    "pid": "19",
    "cid": "258",
    "quid": "10586",
    "cityname": "晋安区"
}, {"pid": "19", "cid": "25", "quid": "10587", "cityname": "思明区"}, {
    "pid": "19",
    "cid": "25",
    "quid": "10588",
    "cityname": "海沧区"
}, {"pid": "19", "cid": "25", "quid": "10589", "cityname": "湖里区"}, {
    "pid": "19",
    "cid": "25",
    "quid": "10590",
    "cityname": "集美区"
}, {"pid": "19", "cid": "25", "quid": "10591", "cityname": "同安区"}, {
    "pid": "19",
    "cid": "25",
    "quid": "10592",
    "cityname": "翔安区"
}, {"pid": "19", "cid": "667", "quid": "10593", "cityname": "城厢区"}, {
    "pid": "19",
    "cid": "667",
    "quid": "10594",
    "cityname": "涵江区"
}, {"pid": "19", "cid": "667", "quid": "10595", "cityname": "荔城区"}, {
    "pid": "19",
    "cid": "667",
    "quid": "10596",
    "cityname": "秀屿区"
}, {"pid": "19", "cid": "437", "quid": "10597", "cityname": "梅列区"}, {
    "pid": "19",
    "cid": "437",
    "quid": "10598",
    "cityname": "三元区"
}, {"pid": "19", "cid": "406", "quid": "10599", "cityname": "鲤城区"}, {
    "pid": "19",
    "cid": "406",
    "quid": "10600",
    "cityname": "丰泽区"
}, {"pid": "19", "cid": "406", "quid": "10601", "cityname": "洛江区"}, {
    "pid": "19",
    "cid": "406",
    "quid": "10602",
    "cityname": "泉港区"
}, {"pid": "19", "cid": "560", "quid": "10603", "cityname": "芗城区"}, {
    "pid": "19",
    "cid": "560",
    "quid": "10604",
    "cityname": "龙文区"
}, {"pid": "19", "cid": "606", "quid": "10605", "cityname": "延平区"}, {
    "pid": "19",
    "cid": "348",
    "quid": "10606",
    "cityname": "新罗区"
}, {"pid": "19", "cid": "378", "quid": "10607", "cityname": "蕉城区"}, {
    "pid": "19",
    "cid": "606",
    "quid": "21805",
    "cityname": "茫荡山"
}, {"pid": "20", "cid": "452", "quid": "474", "cityname": "武当山"}, {
    "pid": "20",
    "cid": "280",
    "quid": "1079",
    "cityname": "麻城市"
}, {"pid": "20", "cid": "280", "quid": "1080", "cityname": "黄州区"}, {
    "pid": "20",
    "cid": "280",
    "quid": "1081",
    "cityname": "蕲春县"
}, {"pid": "20", "cid": "515", "quid": "1122", "cityname": "当阳市"}, {
    "pid": "20",
    "cid": "280",
    "quid": "1219",
    "cityname": "武穴市"
}, {"pid": "20", "cid": "496", "quid": "1773", "cityname": "宜城市"}, {
    "pid": "20",
    "cid": "292",
    "quid": "2501",
    "cityname": "大冶市"
}, {"pid": "20", "cid": "292", "quid": "2502", "cityname": "阳新县"}, {
    "pid": "20",
    "cid": "496",
    "quid": "2503",
    "cityname": "老河口市"
}, {"pid": "20", "cid": "496", "quid": "2504", "cityname": "枣阳市"}, {
    "pid": "20",
    "cid": "496",
    "quid": "2505",
    "cityname": "南漳县"
}, {"pid": "20", "cid": "496", "quid": "2506", "cityname": "谷城县"}, {
    "pid": "20",
    "cid": "496",
    "quid": "2507",
    "cityname": "保康县"
}, {"pid": "20", "cid": "452", "quid": "2508", "cityname": "丹江口市"}, {
    "pid": "20",
    "cid": "452",
    "quid": "2509",
    "cityname": "郧县"
}, {"pid": "20", "cid": "452", "quid": "2510", "cityname": "竹山县"}, {
    "pid": "20",
    "cid": "452",
    "quid": "2511",
    "cityname": "房县"
}, {"pid": "20", "cid": "452", "quid": "2512", "cityname": "郧西县"}, {
    "pid": "20",
    "cid": "452",
    "quid": "2513",
    "cityname": "竹溪县"
}, {"pid": "20", "cid": "328", "quid": "2514", "cityname": "洪湖市"}, {
    "pid": "20",
    "cid": "328",
    "quid": "2515",
    "cityname": "石首市"
}, {"pid": "20", "cid": "328", "quid": "2516", "cityname": "松滋市"}, {
    "pid": "20",
    "cid": "328",
    "quid": "2517",
    "cityname": "监利县"
}, {"pid": "20", "cid": "328", "quid": "2518", "cityname": "公安县"}, {
    "pid": "20",
    "cid": "328",
    "quid": "2519",
    "cityname": "江陵县"
}, {"pid": "20", "cid": "515", "quid": "2520", "cityname": "宜都市"}, {
    "pid": "20",
    "cid": "515",
    "quid": "2521",
    "cityname": "枝江市"
}, {"pid": "20", "cid": "515", "quid": "2522", "cityname": "秭归县"}, {
    "pid": "20",
    "cid": "515",
    "quid": "2523",
    "cityname": "远安县"
}, {"pid": "20", "cid": "515", "quid": "2524", "cityname": "兴山县"}, {
    "pid": "20",
    "cid": "515",
    "quid": "2525",
    "cityname": "五峰土家族自治县"
}, {"pid": "20", "cid": "515", "quid": "2526", "cityname": "长阳"}, {
    "pid": "20",
    "cid": "1121",
    "quid": "2527",
    "cityname": "钟祥市"
}, {"pid": "20", "cid": "1121", "quid": "2528", "cityname": "京山县"}, {
    "pid": "20",
    "cid": "1121",
    "quid": "2529",
    "cityname": "沙洋县"
}, {"pid": "20", "cid": "992", "quid": "2530", "cityname": "梁子湖"}, {
    "pid": "20",
    "cid": "1479",
    "quid": "2531",
    "cityname": "应城市"
}, {"pid": "20", "cid": "1479", "quid": "2532", "cityname": "安陆市"}, {
    "pid": "20",
    "cid": "1479",
    "quid": "2533",
    "cityname": "汉川市"
}, {"pid": "20", "cid": "1479", "quid": "2534", "cityname": "云梦县"}, {
    "pid": "20",
    "cid": "1479",
    "quid": "2535",
    "cityname": "大悟县"
}, {"pid": "20", "cid": "1479", "quid": "2536", "cityname": "孝昌县"}, {
    "pid": "20",
    "cid": "280",
    "quid": "2537",
    "cityname": "红安县"
}, {"pid": "20", "cid": "280", "quid": "2538", "cityname": "罗田县"}, {
    "pid": "20",
    "cid": "280",
    "quid": "2539",
    "cityname": "浠水县"
}, {"pid": "20", "cid": "280", "quid": "2540", "cityname": "黄梅县"}, {
    "pid": "20",
    "cid": "280",
    "quid": "2541",
    "cityname": "英山县"
}, {"pid": "20", "cid": "280", "quid": "2542", "cityname": "团风县"}, {
    "pid": "20",
    "cid": "937",
    "quid": "2543",
    "cityname": "赤壁市"
}, {"pid": "20", "cid": "937", "quid": "2544", "cityname": "嘉鱼县"}, {
    "pid": "20",
    "cid": "937",
    "quid": "2545",
    "cityname": "通山县"
}, {"pid": "20", "cid": "937", "quid": "2546", "cityname": "崇阳县"}, {
    "pid": "20",
    "cid": "937",
    "quid": "2547",
    "cityname": "通城县"
}, {"pid": "20", "cid": "1117", "quid": "2548", "cityname": "广水市"}, {
    "pid": "20",
    "cid": "245",
    "quid": "2552",
    "cityname": "利川市"
}, {"pid": "20", "cid": "245", "quid": "2553", "cityname": "建始县"}, {
    "pid": "20",
    "cid": "245",
    "quid": "2554",
    "cityname": "来凤县"
}, {"pid": "20", "cid": "245", "quid": "2555", "cityname": "巴东县"}, {
    "pid": "20",
    "cid": "245",
    "quid": "2556",
    "cityname": "鹤峰县"
}, {"pid": "20", "cid": "245", "quid": "2557", "cityname": "宣恩县"}, {
    "pid": "20",
    "cid": "245",
    "quid": "2558",
    "cityname": "咸丰县"
}, {"pid": "20", "cid": "477", "quid": "10205", "cityname": "江岸区"}, {
    "pid": "20",
    "cid": "477",
    "quid": "10206",
    "cityname": "武昌区"
}, {"pid": "20", "cid": "477", "quid": "10207", "cityname": "江汉区"}, {
    "pid": "20",
    "cid": "477",
    "quid": "10208",
    "cityname": "硚口区"
}, {"pid": "20", "cid": "477", "quid": "10209", "cityname": "汉阳区"}, {
    "pid": "20",
    "cid": "477",
    "quid": "10210",
    "cityname": "青山区"
}, {"pid": "20", "cid": "477", "quid": "10211", "cityname": "洪山区"}, {
    "pid": "20",
    "cid": "477",
    "quid": "10212",
    "cityname": "东西湖区"
}, {"pid": "20", "cid": "477", "quid": "10213", "cityname": "汉南区"}, {
    "pid": "20",
    "cid": "477",
    "quid": "10214",
    "cityname": "蔡甸区"
}, {"pid": "20", "cid": "477", "quid": "10215", "cityname": "江夏区"}, {
    "pid": "20",
    "cid": "477",
    "quid": "10216",
    "cityname": "黄陂区"
}, {"pid": "20", "cid": "477", "quid": "10217", "cityname": "新洲区"}, {
    "pid": "20",
    "cid": "292",
    "quid": "10218",
    "cityname": "黄石港区"
}, {"pid": "20", "cid": "292", "quid": "10219", "cityname": "西塞山区"}, {
    "pid": "20",
    "cid": "292",
    "quid": "10220",
    "cityname": "下陆区"
}, {"pid": "20", "cid": "292", "quid": "10221", "cityname": "铁山区"}, {
    "pid": "20",
    "cid": "496",
    "quid": "10222",
    "cityname": "襄城区"
}, {"pid": "20", "cid": "496", "quid": "10223", "cityname": "樊城区"}, {
    "pid": "20",
    "cid": "496",
    "quid": "10224",
    "cityname": "襄阳区"
}, {"pid": "20", "cid": "452", "quid": "10225", "cityname": "张湾区"}, {
    "pid": "20",
    "cid": "452",
    "quid": "10226",
    "cityname": "茅箭区"
}, {"pid": "20", "cid": "328", "quid": "10227", "cityname": "沙市区"}, {
    "pid": "20",
    "cid": "328",
    "quid": "10228",
    "cityname": "荆州区"
}, {"pid": "20", "cid": "515", "quid": "10229", "cityname": "西陵区"}, {
    "pid": "20",
    "cid": "515",
    "quid": "10230",
    "cityname": "伍家岗区"
}, {"pid": "20", "cid": "515", "quid": "10231", "cityname": "点军区"}, {
    "pid": "20",
    "cid": "515",
    "quid": "10232",
    "cityname": "猇亭区"
}, {"pid": "20", "cid": "515", "quid": "10233", "cityname": "夷陵区"}, {
    "pid": "20",
    "cid": "1121",
    "quid": "10234",
    "cityname": "东宝区"
}, {"pid": "20", "cid": "1121", "quid": "10235", "cityname": "掇刀区"}, {
    "pid": "20",
    "cid": "992",
    "quid": "10236",
    "cityname": "鄂城区"
}, {"pid": "20", "cid": "992", "quid": "10237", "cityname": "华容区"}, {
    "pid": "20",
    "cid": "1479",
    "quid": "10238",
    "cityname": "孝南区"
}, {"pid": "20", "cid": "280", "quid": "10240", "cityname": "黄州区"}, {
    "pid": "20",
    "cid": "937",
    "quid": "10241",
    "cityname": "咸安区"
}, {"pid": "20", "cid": "1117", "quid": "10242", "cityname": "曾都区"}, {
    "pid": "20",
    "cid": "2550",
    "quid": "12072",
    "cityname": "马湾镇"
}, {"pid": "20", "cid": "2550", "quid": "14089", "cityname": "横林"}, {
    "pid": "20",
    "cid": "2550",
    "quid": "14090",
    "cityname": "横林镇"
}, {"pid": "20", "cid": "2551", "quid": "16896", "cityname": "高石碑镇"}, {
    "pid": "20",
    "cid": "657",
    "quid": "22502",
    "cityname": "神农架林区"
}, {"pid": "21", "cid": "539", "quid": "204", "cityname": "城陵矶"}, {
    "pid": "21",
    "cid": "598",
    "quid": "446",
    "cityname": "韶山市"
}, {"pid": "21", "cid": "297", "quid": "677", "cityname": "衡山"}, {
    "pid": "21",
    "cid": "1110",
    "quid": "866",
    "cityname": "凤凰县"
}, {"pid": "21", "cid": "598", "quid": "917", "cityname": "湘乡市"}, {
    "pid": "21",
    "cid": "918",
    "quid": "919",
    "cityname": "涟源市"
}, {"pid": "21", "cid": "918", "quid": "920", "cityname": "冷水江市"}, {
    "pid": "21",
    "cid": "918",
    "quid": "921",
    "cityname": "新化县"
}, {"pid": "21", "cid": "282", "quid": "925", "cityname": "溆浦县"}, {
    "pid": "21",
    "cid": "282",
    "quid": "926",
    "cityname": "辰溪县"
}, {"pid": "21", "cid": "297", "quid": "940", "cityname": "耒阳市"}, {
    "pid": "21",
    "cid": "601",
    "quid": "981",
    "cityname": "醴陵市"
}, {"pid": "21", "cid": "297", "quid": "989", "cityname": "祁东县"}, {
    "pid": "21",
    "cid": "970",
    "quid": "990",
    "cityname": "东安县"
}, {"pid": "21", "cid": "201", "quid": "1123", "cityname": "石门县"}, {
    "pid": "21",
    "cid": "201",
    "quid": "1124",
    "cityname": "临澧"
}, {"pid": "21", "cid": "601", "quid": "1321", "cityname": "茶陵县"}, {
    "pid": "21",
    "cid": "201",
    "quid": "1323",
    "cityname": "澧县"
}, {"pid": "21", "cid": "206", "quid": "1772", "cityname": "浏阳市"}, {
    "pid": "21",
    "cid": "206",
    "quid": "2559",
    "cityname": "长沙县"
}, {"pid": "21", "cid": "206", "quid": "2560", "cityname": "望城区"}, {
    "pid": "21",
    "cid": "206",
    "quid": "2561",
    "cityname": "宁乡县"
}, {"pid": "21", "cid": "601", "quid": "2562", "cityname": "株洲县"}, {
    "pid": "21",
    "cid": "601",
    "quid": "2563",
    "cityname": "炎陵县"
}, {"pid": "21", "cid": "601", "quid": "2564", "cityname": "攸县"}, {
    "pid": "21",
    "cid": "598",
    "quid": "2565",
    "cityname": "湘潭县"
}, {"pid": "21", "cid": "297", "quid": "2566", "cityname": "常宁市"}, {
    "pid": "21",
    "cid": "297",
    "quid": "2567",
    "cityname": "衡阳县"
}, {"pid": "21", "cid": "297", "quid": "2568", "cityname": "衡东县"}, {
    "pid": "21",
    "cid": "297",
    "quid": "2569",
    "cityname": "衡南县"
}, {"pid": "21", "cid": "1111", "quid": "2570", "cityname": "武冈市"}, {
    "pid": "21",
    "cid": "1111",
    "quid": "2571",
    "cityname": "邵东县"
}, {"pid": "21", "cid": "1111", "quid": "2572", "cityname": "洞口县"}, {
    "pid": "21",
    "cid": "1111",
    "quid": "2573",
    "cityname": "新邵县"
}, {"pid": "21", "cid": "1111", "quid": "2574", "cityname": "绥宁县"}, {
    "pid": "21",
    "cid": "1111",
    "quid": "2575",
    "cityname": "新宁县"
}, {"pid": "21", "cid": "1111", "quid": "2576", "cityname": "邵阳县"}, {
    "pid": "21",
    "cid": "1111",
    "quid": "2577",
    "cityname": "隆回县"
}, {"pid": "21", "cid": "1111", "quid": "2578", "cityname": "城步苗族自治县"}, {
    "pid": "21",
    "cid": "539",
    "quid": "2579",
    "cityname": "临湘市"
}, {"pid": "21", "cid": "539", "quid": "2580", "cityname": "汨罗市"}, {
    "pid": "21",
    "cid": "539",
    "quid": "2581",
    "cityname": "岳阳县"
}, {"pid": "21", "cid": "539", "quid": "2582", "cityname": "湘阴县"}, {
    "pid": "21",
    "cid": "539",
    "quid": "2583",
    "cityname": "平江县"
}, {"pid": "21", "cid": "539", "quid": "2584", "cityname": "华容县"}, {
    "pid": "21",
    "cid": "201",
    "quid": "2585",
    "cityname": "津市市"
}, {"pid": "21", "cid": "201", "quid": "2586", "cityname": "桃源县"}, {
    "pid": "21",
    "cid": "201",
    "quid": "2587",
    "cityname": "汉寿县"
}, {"pid": "21", "cid": "201", "quid": "2588", "cityname": "安乡县"}, {
    "pid": "21",
    "cid": "27",
    "quid": "2589",
    "cityname": "慈利县"
}, {"pid": "21", "cid": "27", "quid": "2590", "cityname": "桑植县"}, {
    "pid": "21",
    "cid": "27",
    "quid": "2591",
    "cityname": "武陵源"
}, {"pid": "21", "cid": "1125", "quid": "2592", "cityname": "沅江市"}, {
    "pid": "21",
    "cid": "1125",
    "quid": "2593",
    "cityname": "桃江县"
}, {"pid": "21", "cid": "1125", "quid": "2594", "cityname": "南县"}, {
    "pid": "21",
    "cid": "1125",
    "quid": "2595",
    "cityname": "安化县"
}, {"pid": "21", "cid": "612", "quid": "2596", "cityname": "资兴市"}, {
    "pid": "21",
    "cid": "612",
    "quid": "2597",
    "cityname": "宜章县"
}, {"pid": "21", "cid": "612", "quid": "2598", "cityname": "汝城县"}, {
    "pid": "21",
    "cid": "612",
    "quid": "2599",
    "cityname": "安仁县"
}, {"pid": "21", "cid": "612", "quid": "2600", "cityname": "嘉禾县"}, {
    "pid": "21",
    "cid": "612",
    "quid": "2601",
    "cityname": "临武县"
}, {"pid": "21", "cid": "612", "quid": "2602", "cityname": "桂东县"}, {
    "pid": "21",
    "cid": "612",
    "quid": "2603",
    "cityname": "永兴县"
}, {"pid": "21", "cid": "612", "quid": "2604", "cityname": "桂阳县"}, {
    "pid": "21",
    "cid": "970",
    "quid": "2605",
    "cityname": "祁阳县"
}, {"pid": "21", "cid": "970", "quid": "2606", "cityname": "蓝山县"}, {
    "pid": "21",
    "cid": "970",
    "quid": "2607",
    "cityname": "宁远县"
}, {"pid": "21", "cid": "970", "quid": "2608", "cityname": "新田县"}, {
    "pid": "21",
    "cid": "970",
    "quid": "2609",
    "cityname": "江永县"
}, {"pid": "21", "cid": "970", "quid": "2610", "cityname": "道县"}, {
    "pid": "21",
    "cid": "970",
    "quid": "2611",
    "cityname": "双牌县"
}, {"pid": "21", "cid": "970", "quid": "2612", "cityname": "江华瑶族自治县"}, {
    "pid": "21",
    "cid": "282",
    "quid": "2613",
    "cityname": "洪江市"
}, {"pid": "21", "cid": "282", "quid": "2614", "cityname": "会同县"}, {
    "pid": "21",
    "cid": "282",
    "quid": "2615",
    "cityname": "沅陵县"
}, {"pid": "21", "cid": "282", "quid": "2616", "cityname": "中方县"}, {
    "pid": "21",
    "cid": "282",
    "quid": "2617",
    "cityname": "新晃侗族自治县"
}, {"pid": "21", "cid": "282", "quid": "2618", "cityname": "芷江侗族自治县"}, {
    "pid": "21",
    "cid": "282",
    "quid": "2619",
    "cityname": "通道侗族自治县"
}, {"pid": "21", "cid": "282", "quid": "2620", "cityname": "靖州苗族侗族自治县"}, {
    "pid": "21",
    "cid": "282",
    "quid": "2621",
    "cityname": "麻阳苗族自治县"
}, {"pid": "21", "cid": "918", "quid": "2622", "cityname": "双峰县"}, {
    "pid": "21",
    "cid": "1110",
    "quid": "2623",
    "cityname": "古丈县"
}, {"pid": "21", "cid": "1110", "quid": "2624", "cityname": "龙山县"}, {
    "pid": "21",
    "cid": "1110",
    "quid": "2625",
    "cityname": "永顺县"
}, {"pid": "21", "cid": "1110", "quid": "2626", "cityname": "泸溪县"}, {
    "pid": "21",
    "cid": "1110",
    "quid": "2627",
    "cityname": "保靖县"
}, {"pid": "21", "cid": "1110", "quid": "2628", "cityname": "花垣县"}, {
    "pid": "21",
    "cid": "282",
    "quid": "3230",
    "cityname": "洪江区"
}, {"pid": "21", "cid": "206", "quid": "10168", "cityname": "岳麓区"}, {
    "pid": "21",
    "cid": "206",
    "quid": "10169",
    "cityname": "芙蓉区"
}, {"pid": "21", "cid": "206", "quid": "10170", "cityname": "天心区"}, {
    "pid": "21",
    "cid": "206",
    "quid": "10171",
    "cityname": "开福区"
}, {"pid": "21", "cid": "206", "quid": "10172", "cityname": "雨花区"}, {
    "pid": "21",
    "cid": "601",
    "quid": "10173",
    "cityname": "天元区"
}, {"pid": "21", "cid": "601", "quid": "10174", "cityname": "荷塘区"}, {
    "pid": "21",
    "cid": "601",
    "quid": "10175",
    "cityname": "芦淞区"
}, {"pid": "21", "cid": "601", "quid": "10176", "cityname": "石峰区"}, {
    "pid": "21",
    "cid": "598",
    "quid": "10177",
    "cityname": "雨湖区"
}, {"pid": "21", "cid": "598", "quid": "10178", "cityname": "岳塘区"}, {
    "pid": "21",
    "cid": "297",
    "quid": "10179",
    "cityname": "雁峰区"
}, {"pid": "21", "cid": "297", "quid": "10180", "cityname": "珠晖区"}, {
    "pid": "21",
    "cid": "297",
    "quid": "10181",
    "cityname": "石鼓区"
}, {"pid": "21", "cid": "297", "quid": "10182", "cityname": "蒸湘区"}, {
    "pid": "21",
    "cid": "297",
    "quid": "10183",
    "cityname": "南岳区"
}, {"pid": "21", "cid": "1111", "quid": "10184", "cityname": "双清区"}, {
    "pid": "21",
    "cid": "1111",
    "quid": "10185",
    "cityname": "大祥区"
}, {"pid": "21", "cid": "1111", "quid": "10186", "cityname": "北塔区"}, {
    "pid": "21",
    "cid": "539",
    "quid": "10187",
    "cityname": "岳阳楼区"
}, {"pid": "21", "cid": "539", "quid": "10188", "cityname": "君山区"}, {
    "pid": "21",
    "cid": "539",
    "quid": "10189",
    "cityname": "云溪区"
}, {"pid": "21", "cid": "201", "quid": "10191", "cityname": "武陵区"}, {
    "pid": "21",
    "cid": "201",
    "quid": "10192",
    "cityname": "鼎城区"
}, {"pid": "21", "cid": "27", "quid": "10193", "cityname": "永定区"}, {
    "pid": "21",
    "cid": "27",
    "quid": "10194",
    "cityname": "武陵源区"
}, {"pid": "21", "cid": "1125", "quid": "10196", "cityname": "赫山区"}, {
    "pid": "21",
    "cid": "1125",
    "quid": "10197",
    "cityname": "资阳区"
}, {"pid": "21", "cid": "612", "quid": "10199", "cityname": "北湖区"}, {
    "pid": "21",
    "cid": "612",
    "quid": "10200",
    "cityname": "苏仙区"
}, {"pid": "21", "cid": "970", "quid": "10201", "cityname": "冷水滩区"}, {
    "pid": "21",
    "cid": "970",
    "quid": "10202",
    "cityname": "芝山区"
}, {"pid": "21", "cid": "282", "quid": "10203", "cityname": "鹤城区"}, {
    "pid": "21",
    "cid": "918",
    "quid": "10204",
    "cityname": "娄星区"
}, {"pid": "21", "cid": "970", "quid": "12019", "cityname": "零陵区"}, {
    "pid": "21",
    "cid": "206",
    "quid": "22583",
    "cityname": "星沙经济技术开发区"
}, {"pid": "22", "cid": "28", "quid": "94", "cityname": "都江堰"}, {
    "pid": "22",
    "cid": "345",
    "quid": "95",
    "cityname": "峨眉山"
}, {"pid": "22", "cid": "237", "quid": "750", "cityname": "广汉市"}, {
    "pid": "22",
    "cid": "370",
    "quid": "1054",
    "cityname": "江油市"
}, {"pid": "22", "cid": "234", "quid": "1099", "cityname": "万源市"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "1222",
    "cityname": "稻城县"
}, {"pid": "22", "cid": "234", "quid": "1233", "cityname": "达县"}, {
    "pid": "22",
    "cid": "377",
    "quid": "1336",
    "cityname": "营山县"
}, {"pid": "22", "cid": "2152", "quid": "1372", "cityname": "松潘县"}, {
    "pid": "22",
    "cid": "267",
    "quid": "1490",
    "cityname": "青川县"
}, {"pid": "22", "cid": "1532", "quid": "1496", "cityname": "甘孜县"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "1497",
    "cityname": "小金县"
}, {"pid": "22", "cid": "1100", "quid": "1499", "cityname": "华蓥市"}, {
    "pid": "22",
    "cid": "1100",
    "quid": "1500",
    "cityname": "邻水县"
}, {"pid": "22", "cid": "1100", "quid": "1501", "cityname": "武胜县"}, {
    "pid": "22",
    "cid": "1100",
    "quid": "1502",
    "cityname": "岳池县"
}, {"pid": "22", "cid": "370", "quid": "1503", "cityname": "梓潼县"}, {
    "pid": "22",
    "cid": "267",
    "quid": "1504",
    "cityname": "剑阁县"
}, {"pid": "22", "cid": "377", "quid": "1505", "cityname": "阆中市"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "1533",
    "cityname": "丹巴县"
}, {"pid": "22", "cid": "1532", "quid": "1552", "cityname": "泸定县"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "1585",
    "cityname": "雅江县"
}, {"pid": "22", "cid": "1532", "quid": "1586", "cityname": "道孚县"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "1587",
    "cityname": "理塘县"
}, {"pid": "22", "cid": "1532", "quid": "1588", "cityname": "石渠县"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "1589",
    "cityname": "德格县"
}, {"pid": "22", "cid": "1532", "quid": "1590", "cityname": "巴塘县"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "1591",
    "cityname": "炉霍县"
}, {"pid": "22", "cid": "1532", "quid": "1592", "cityname": "白玉县"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "1593",
    "cityname": "新龙县"
}, {"pid": "22", "cid": "1589", "quid": "1594", "cityname": "马尼干戈乡"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "1595",
    "cityname": "色达县"
}, {"pid": "22", "cid": "1532", "quid": "1596", "cityname": "乡城县"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "1597",
    "cityname": "得荣县"
}, {"pid": "22", "cid": "1532", "quid": "1598", "cityname": "九龙县"}, {
    "pid": "22",
    "cid": "494",
    "quid": "1599",
    "cityname": "泸沽湖[四川境内]"
}, {"pid": "22", "cid": "377", "quid": "1600", "cityname": "仪陇县"}, {
    "pid": "22",
    "cid": "377",
    "quid": "1601",
    "cityname": "南部县"
}, {"pid": "22", "cid": "377", "quid": "1602", "cityname": "蓬安县"}, {
    "pid": "22",
    "cid": "377",
    "quid": "1603",
    "cityname": "西充县"
}, {"pid": "22", "cid": "234", "quid": "2154", "cityname": "渠县"}, {
    "pid": "22",
    "cid": "234",
    "quid": "2155",
    "cityname": "宣汉县"
}, {"pid": "22", "cid": "234", "quid": "2156", "cityname": "开江县"}, {
    "pid": "22",
    "cid": "234",
    "quid": "2157",
    "cityname": "大竹县"
}, {"pid": "22", "cid": "28", "quid": "2158", "cityname": "彭州市"}, {
    "pid": "22",
    "cid": "28",
    "quid": "2159",
    "cityname": "邛崃市"
}, {"pid": "22", "cid": "28", "quid": "2160", "cityname": "崇州市"}, {
    "pid": "22",
    "cid": "28",
    "quid": "2161",
    "cityname": "双流县"
}, {"pid": "22", "cid": "28", "quid": "2162", "cityname": "金堂县"}, {
    "pid": "22",
    "cid": "28",
    "quid": "2163",
    "cityname": "郫县"
}, {"pid": "22", "cid": "28", "quid": "2164", "cityname": "新津县"}, {
    "pid": "22",
    "cid": "28",
    "quid": "2165",
    "cityname": "大邑县"
}, {"pid": "22", "cid": "28", "quid": "2166", "cityname": "蒲江县"}, {
    "pid": "22",
    "cid": "267",
    "quid": "2167",
    "cityname": "旺苍县"
}, {"pid": "22", "cid": "267", "quid": "2168", "cityname": "苍溪县"}, {
    "pid": "22",
    "cid": "237",
    "quid": "2169",
    "cityname": "什邡市"
}, {"pid": "22", "cid": "237", "quid": "2170", "cityname": "绵竹市"}, {
    "pid": "22",
    "cid": "237",
    "quid": "2171",
    "cityname": "罗江县"
}, {"pid": "22", "cid": "237", "quid": "2172", "cityname": "中江县"}, {
    "pid": "22",
    "cid": "370",
    "quid": "2173",
    "cityname": "盐亭县"
}, {"pid": "22", "cid": "370", "quid": "2174", "cityname": "三台县"}, {
    "pid": "22",
    "cid": "370",
    "quid": "2175",
    "cityname": "平武县"
}, {"pid": "22", "cid": "370", "quid": "2176", "cityname": "安县"}, {
    "pid": "22",
    "cid": "370",
    "quid": "2178",
    "cityname": "北川"
}, {"pid": "22", "cid": "544", "quid": "2180", "cityname": "荣县"}, {
    "pid": "22",
    "cid": "544",
    "quid": "2181",
    "cityname": "富顺县"
}, {"pid": "22", "cid": "1097", "quid": "2183", "cityname": "米易县"}, {
    "pid": "22",
    "cid": "1097",
    "quid": "2184",
    "cityname": "盐边县"
}, {"pid": "22", "cid": "355", "quid": "2185", "cityname": "泸县"}, {
    "pid": "22",
    "cid": "355",
    "quid": "2186",
    "cityname": "合江县"
}, {"pid": "22", "cid": "355", "quid": "2187", "cityname": "叙永县"}, {
    "pid": "22",
    "cid": "355",
    "quid": "2188",
    "cityname": "古蔺县"
}, {"pid": "22", "cid": "1371", "quid": "2189", "cityname": "射洪县"}, {
    "pid": "22",
    "cid": "1371",
    "quid": "2190",
    "cityname": "蓬溪县"
}, {"pid": "22", "cid": "1371", "quid": "2191", "cityname": "大英县"}, {
    "pid": "22",
    "cid": "1011",
    "quid": "2192",
    "cityname": "资中县"
}, {"pid": "22", "cid": "1011", "quid": "2193", "cityname": "隆昌县"}, {
    "pid": "22",
    "cid": "1011",
    "quid": "2194",
    "cityname": "威远县"
}, {"pid": "22", "cid": "345", "quid": "2195", "cityname": "夹江县"}, {
    "pid": "22",
    "cid": "345",
    "quid": "2196",
    "cityname": "井研县"
}, {"pid": "22", "cid": "345", "quid": "2197", "cityname": "犍为县"}, {
    "pid": "22",
    "cid": "345",
    "quid": "2198",
    "cityname": "沐川县"
}, {"pid": "22", "cid": "345", "quid": "2199", "cityname": "马边"}, {
    "pid": "22",
    "cid": "345",
    "quid": "2200",
    "cityname": "峨边"
}, {"pid": "22", "cid": "514", "quid": "2201", "cityname": "宜宾县"}, {
    "pid": "22",
    "cid": "514",
    "quid": "2202",
    "cityname": "兴文县"
}, {"pid": "22", "cid": "514", "quid": "2204", "cityname": "南溪县"}, {
    "pid": "22",
    "cid": "514",
    "quid": "2205",
    "cityname": "珙县"
}, {"pid": "22", "cid": "514", "quid": "2206", "cityname": "长宁县"}, {
    "pid": "22",
    "cid": "514",
    "quid": "2207",
    "cityname": "高县"
}, {"pid": "22", "cid": "514", "quid": "2208", "cityname": "江安县"}, {
    "pid": "22",
    "cid": "514",
    "quid": "2209",
    "cityname": "筠连县"
}, {"pid": "22", "cid": "514", "quid": "2210", "cityname": "屏山县"}, {
    "pid": "22",
    "cid": "1148",
    "quid": "2211",
    "cityname": "仁寿县"
}, {"pid": "22", "cid": "1148", "quid": "2212", "cityname": "彭山县"}, {
    "pid": "22",
    "cid": "1148",
    "quid": "2213",
    "cityname": "洪雅县"
}, {"pid": "22", "cid": "1148", "quid": "2214", "cityname": "丹棱县"}, {
    "pid": "22",
    "cid": "1148",
    "quid": "2215",
    "cityname": "青神县"
}, {"pid": "22", "cid": "2223", "quid": "2216", "cityname": "芦山县"}, {
    "pid": "22",
    "cid": "2223",
    "quid": "2217",
    "cityname": "石棉县"
}, {"pid": "22", "cid": "2223", "quid": "2218", "cityname": "名山县"}, {
    "pid": "22",
    "cid": "2223",
    "quid": "2219",
    "cityname": "天全县"
}, {"pid": "22", "cid": "2223", "quid": "2220", "cityname": "荥经县"}, {
    "pid": "22",
    "cid": "2223",
    "quid": "2221",
    "cityname": "宝兴县"
}, {"pid": "22", "cid": "2223", "quid": "2222", "cityname": "汉源县"}, {
    "pid": "22",
    "cid": "2224",
    "quid": "2225",
    "cityname": "南江县"
}, {"pid": "22", "cid": "2224", "quid": "2226", "cityname": "平昌县"}, {
    "pid": "22",
    "cid": "2224",
    "quid": "2227",
    "cityname": "通江县"
}, {"pid": "22", "cid": "2228", "quid": "2229", "cityname": "简阳市"}, {
    "pid": "22",
    "cid": "2228",
    "quid": "2230",
    "cityname": "乐至县"
}, {"pid": "22", "cid": "2228", "quid": "2231", "cityname": "安岳县"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "2232",
    "cityname": "红原县"
}, {"pid": "22", "cid": "2152", "quid": "2233", "cityname": "汶川县"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "2234",
    "cityname": "阿坝县"
}, {"pid": "22", "cid": "2152", "quid": "2235", "cityname": "若尔盖县"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "2236",
    "cityname": "黑水县"
}, {"pid": "22", "cid": "2152", "quid": "2237", "cityname": "金川县"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "2238",
    "cityname": "壤塘县"
}, {"pid": "22", "cid": "2152", "quid": "2239", "cityname": "茂县"}, {
    "pid": "22",
    "cid": "494",
    "quid": "2240",
    "cityname": "美姑县"
}, {"pid": "22", "cid": "494", "quid": "2241", "cityname": "昭觉县"}, {
    "pid": "22",
    "cid": "494",
    "quid": "2242",
    "cityname": "金阳县"
}, {"pid": "22", "cid": "494", "quid": "2243", "cityname": "甘洛县"}, {
    "pid": "22",
    "cid": "494",
    "quid": "2244",
    "cityname": "布拖县"
}, {"pid": "22", "cid": "494", "quid": "2245", "cityname": "雷波县"}, {
    "pid": "22",
    "cid": "494",
    "quid": "2246",
    "cityname": "普格县"
}, {"pid": "22", "cid": "494", "quid": "2247", "cityname": "宁南县"}, {
    "pid": "22",
    "cid": "494",
    "quid": "2248",
    "cityname": "喜德县"
}, {"pid": "22", "cid": "494", "quid": "2249", "cityname": "会东县"}, {
    "pid": "22",
    "cid": "494",
    "quid": "2250",
    "cityname": "越西县"
}, {"pid": "22", "cid": "494", "quid": "2251", "cityname": "会理县"}, {
    "pid": "22",
    "cid": "494",
    "quid": "2252",
    "cityname": "盐源县"
}, {"pid": "22", "cid": "494", "quid": "2253", "cityname": "德昌县"}, {
    "pid": "22",
    "cid": "494",
    "quid": "2254",
    "cityname": "冕宁县"
}, {"pid": "22", "cid": "494", "quid": "2255", "cityname": "木里"}, {
    "pid": "22",
    "cid": "28",
    "quid": "10033",
    "cityname": "青羊区"
}, {"pid": "22", "cid": "28", "quid": "10034", "cityname": "锦江区"}, {
    "pid": "22",
    "cid": "28",
    "quid": "10035",
    "cityname": "金牛区"
}, {"pid": "22", "cid": "28", "quid": "10036", "cityname": "武侯区"}, {
    "pid": "22",
    "cid": "28",
    "quid": "10037",
    "cityname": "成华区"
}, {"pid": "22", "cid": "28", "quid": "10038", "cityname": "龙泉驿区"}, {
    "pid": "22",
    "cid": "28",
    "quid": "10039",
    "cityname": "青白江区"
}, {"pid": "22", "cid": "28", "quid": "10040", "cityname": "新都区"}, {
    "pid": "22",
    "cid": "28",
    "quid": "10041",
    "cityname": "温江区"
}, {"pid": "22", "cid": "544", "quid": "10042", "cityname": "大安区"}, {
    "pid": "22",
    "cid": "544",
    "quid": "10043",
    "cityname": "自流井区"
}, {"pid": "22", "cid": "544", "quid": "10044", "cityname": "贡井区"}, {
    "pid": "22",
    "cid": "544",
    "quid": "10045",
    "cityname": "沿滩区"
}, {"pid": "22", "cid": "1097", "quid": "10046", "cityname": "东区"}, {
    "pid": "22",
    "cid": "1097",
    "quid": "10047",
    "cityname": "西区"
}, {"pid": "22", "cid": "1097", "quid": "10048", "cityname": "仁和区"}, {
    "pid": "22",
    "cid": "355",
    "quid": "10049",
    "cityname": "江阳区"
}, {"pid": "22", "cid": "355", "quid": "10050", "cityname": "纳溪区"}, {
    "pid": "22",
    "cid": "355",
    "quid": "10051",
    "cityname": "龙马潭区"
}, {"pid": "22", "cid": "237", "quid": "10052", "cityname": "旌阳区"}, {
    "pid": "22",
    "cid": "370",
    "quid": "10053",
    "cityname": "涪城区"
}, {"pid": "22", "cid": "370", "quid": "10054", "cityname": "游仙区"}, {
    "pid": "22",
    "cid": "267",
    "quid": "10055",
    "cityname": "市中区"
}, {"pid": "22", "cid": "267", "quid": "10056", "cityname": "元坝区"}, {
    "pid": "22",
    "cid": "267",
    "quid": "10057",
    "cityname": "朝天区"
}, {"pid": "22", "cid": "1371", "quid": "10058", "cityname": "船山区"}, {
    "pid": "22",
    "cid": "1371",
    "quid": "10059",
    "cityname": "安居区"
}, {"pid": "22", "cid": "1011", "quid": "10060", "cityname": "市中区"}, {
    "pid": "22",
    "cid": "1011",
    "quid": "10061",
    "cityname": "东兴区"
}, {"pid": "22", "cid": "345", "quid": "10062", "cityname": "市中区"}, {
    "pid": "22",
    "cid": "345",
    "quid": "10063",
    "cityname": "五通桥区"
}, {"pid": "22", "cid": "345", "quid": "10064", "cityname": "沙湾区"}, {
    "pid": "22",
    "cid": "345",
    "quid": "10065",
    "cityname": "金口河区"
}, {"pid": "22", "cid": "377", "quid": "10066", "cityname": "顺庆区"}, {
    "pid": "22",
    "cid": "377",
    "quid": "10067",
    "cityname": "高坪区"
}, {"pid": "22", "cid": "377", "quid": "10068", "cityname": "嘉陵区"}, {
    "pid": "22",
    "cid": "514",
    "quid": "10069",
    "cityname": "翠屏区"
}, {"pid": "22", "cid": "1100", "quid": "10070", "cityname": "广安区"}, {
    "pid": "22",
    "cid": "234",
    "quid": "10071",
    "cityname": "通川区"
}, {"pid": "22", "cid": "1148", "quid": "10072", "cityname": "东坡区"}, {
    "pid": "22",
    "cid": "2223",
    "quid": "10073",
    "cityname": "雨城区"
}, {"pid": "22", "cid": "2224", "quid": "10074", "cityname": "巴州区"}, {
    "pid": "22",
    "cid": "2228",
    "quid": "10075",
    "cityname": "雁江区"
}, {"pid": "22", "cid": "2152", "quid": "11185", "cityname": "★马尔康镇"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "11186",
    "cityname": "旧部乡"
}, {"pid": "22", "cid": "2152", "quid": "11187", "cityname": "康山乡"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "11188",
    "cityname": "草登乡"
}, {"pid": "22", "cid": "2152", "quid": "11189", "cityname": "龙尔甲乡"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "11190",
    "cityname": "大藏乡"
}, {"pid": "22", "cid": "2152", "quid": "11191", "cityname": "沙尔宗乡"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "11192",
    "cityname": "脚木足乡"
}, {"pid": "22", "cid": "2152", "quid": "11193", "cityname": "松岗镇"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "11194",
    "cityname": "卓克基镇"
}, {"pid": "22", "cid": "2152", "quid": "11195", "cityname": "白湾乡"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "11196",
    "cityname": "木尔宗乡"
}, {"pid": "22", "cid": "2152", "quid": "11197", "cityname": "党坝乡"}, {
    "pid": "22",
    "cid": "2152",
    "quid": "11198",
    "cityname": "梭磨乡"
}, {"pid": "22", "cid": "1532", "quid": "11300", "cityname": "★炉城镇"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "11301",
    "cityname": "姑咱镇"
}, {"pid": "22", "cid": "1532", "quid": "11302", "cityname": "卖崩乡"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "11303",
    "cityname": "六巴乡"
}, {"pid": "22", "cid": "1532", "quid": "11304", "cityname": "新都桥镇"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "11305",
    "cityname": "塔公乡"
}, {"pid": "22", "cid": "1532", "quid": "11429", "cityname": "雅拉乡"}, {
    "pid": "22",
    "cid": "22563",
    "quid": "22564",
    "cityname": "九寨沟"
}, {"pid": "22", "cid": "22563", "quid": "22568", "cityname": "若尔盖县"}, {
    "pid": "22",
    "cid": "22563",
    "quid": "22569",
    "cityname": "松潘县"
}, {"pid": "22", "cid": "22508", "quid": "22574", "cityname": "丹巴县"}, {
    "pid": "22",
    "cid": "1532",
    "quid": "22580",
    "cityname": "康定县"
}, {"pid": "22", "cid": "22563", "quid": "22584", "cityname": "理县"}, {
    "pid": "22",
    "cid": "22563",
    "quid": "22585",
    "cityname": "汶川县"
}, {"pid": "22", "cid": "22508", "quid": "22588", "cityname": "稻城"}, {
    "pid": "22",
    "cid": "22563",
    "quid": "22597",
    "cityname": "红原县"
}, {"pid": "22", "cid": "494", "quid": "22601", "cityname": "海南乡"}, {
    "pid": "22",
    "cid": "22563",
    "quid": "22605",
    "cityname": "小金县"
}, {"pid": "23", "cid": "251", "quid": "210", "cityname": "顺德"}, {
    "pid": "23",
    "cid": "447",
    "quid": "212",
    "cityname": "潮阳区"
}, {"pid": "23", "cid": "299", "quid": "298", "cityname": "惠阳"}, {
    "pid": "23",
    "cid": "316",
    "quid": "335",
    "cityname": "开平市"
}, {"pid": "23", "cid": "2036", "quid": "339", "cityname": "罗定市"}, {
    "pid": "23",
    "cid": "956",
    "quid": "389",
    "cityname": "普宁市"
}, {"pid": "23", "cid": "251", "quid": "445", "cityname": "三水区"}, {
    "pid": "23",
    "cid": "368",
    "quid": "480",
    "cityname": "五华县"
}, {"pid": "23", "cid": "316", "quid": "581", "cityname": "新会区"}, {
    "pid": "23",
    "cid": "447",
    "quid": "629",
    "cityname": "澄海区"
}, {"pid": "23", "cid": "1105", "quid": "686", "cityname": "高州市"}, {
    "pid": "23",
    "cid": "251",
    "quid": "689",
    "cityname": "南海市"
}, {"pid": "23", "cid": "316", "quid": "729", "cityname": "台山市"}, {
    "pid": "23",
    "cid": "1422",
    "quid": "884",
    "cityname": "英德市"
}, {"pid": "23", "cid": "223", "quid": "913", "cityname": "横沥"}, {
    "pid": "23",
    "cid": "223",
    "quid": "914",
    "cityname": "樟木头"
}, {"pid": "23", "cid": "693", "quid": "927", "cityname": "和平县"}, {
    "pid": "23",
    "cid": "693",
    "quid": "928",
    "cityname": "龙川县"
}, {"pid": "23", "cid": "422", "quid": "938", "cityname": "乐昌市"}, {
    "pid": "23",
    "cid": "422",
    "quid": "939",
    "cityname": "曲江区"
}, {"pid": "23", "cid": "368", "quid": "954", "cityname": "兴宁市"}, {
    "pid": "23",
    "cid": "368",
    "quid": "955",
    "cityname": "丰顺县"
}, {"pid": "23", "cid": "2036", "quid": "1101", "cityname": "新兴县"}, {
    "pid": "23",
    "cid": "692",
    "quid": "1103",
    "cityname": "阳春市"
}, {"pid": "23", "cid": "32", "quid": "1203", "cityname": "增城市"}, {
    "pid": "23",
    "cid": "32",
    "quid": "1421",
    "cityname": "从化市"
}, {"pid": "23", "cid": "316", "quid": "1428", "cityname": "恩平市"}, {
    "pid": "23",
    "cid": "552",
    "quid": "1498",
    "cityname": "高要市"
}, {"pid": "23", "cid": "1436", "quid": "1516", "cityname": "陆丰市"}, {
    "pid": "23",
    "cid": "422",
    "quid": "1831",
    "cityname": "仁化县"
}, {"pid": "23", "cid": "692", "quid": "1838", "cityname": "阳西县"}, {
    "pid": "23",
    "cid": "547",
    "quid": "1839",
    "cityname": "雷州市"
}, {"pid": "23", "cid": "547", "quid": "1840", "cityname": "廉江市"}, {
    "pid": "23",
    "cid": "447",
    "quid": "2038",
    "cityname": "南澳县"
}, {"pid": "23", "cid": "422", "quid": "2039", "cityname": "南雄市"}, {
    "pid": "23",
    "cid": "422",
    "quid": "2040",
    "cityname": "始兴县"
}, {"pid": "23", "cid": "422", "quid": "2041", "cityname": "翁源县"}, {
    "pid": "23",
    "cid": "422",
    "quid": "2042",
    "cityname": "新丰县"
}, {"pid": "23", "cid": "422", "quid": "2043", "cityname": "乳源"}, {
    "pid": "23",
    "cid": "316",
    "quid": "2044",
    "cityname": "鹤山市"
}, {"pid": "23", "cid": "547", "quid": "2045", "cityname": "吴川市"}, {
    "pid": "23",
    "cid": "547",
    "quid": "2046",
    "cityname": "遂溪县"
}, {"pid": "23", "cid": "547", "quid": "2047", "cityname": "徐闻县"}, {
    "pid": "23",
    "cid": "1105",
    "quid": "2048",
    "cityname": "化州市"
}, {"pid": "23", "cid": "1105", "quid": "2049", "cityname": "信宜市"}, {
    "pid": "23",
    "cid": "1105",
    "quid": "2050",
    "cityname": "电白县"
}, {"pid": "23", "cid": "552", "quid": "2051", "cityname": "四会市"}, {
    "pid": "23",
    "cid": "552",
    "quid": "2052",
    "cityname": "广宁县"
}, {"pid": "23", "cid": "552", "quid": "2053", "cityname": "德庆县"}, {
    "pid": "23",
    "cid": "552",
    "quid": "2054",
    "cityname": "封开县"
}, {"pid": "23", "cid": "552", "quid": "2055", "cityname": "怀集县"}, {
    "pid": "23",
    "cid": "299",
    "quid": "2056",
    "cityname": "惠东县"
}, {"pid": "23", "cid": "299", "quid": "2057", "cityname": "博罗县"}, {
    "pid": "23",
    "cid": "299",
    "quid": "2058",
    "cityname": "龙门县"
}, {"pid": "23", "cid": "368", "quid": "2059", "cityname": "梅县"}, {
    "pid": "23",
    "cid": "368",
    "quid": "2060",
    "cityname": "蕉岭县"
}, {"pid": "23", "cid": "368", "quid": "2061", "cityname": "大埔县"}, {
    "pid": "23",
    "cid": "368",
    "quid": "2062",
    "cityname": "平远县"
}, {"pid": "23", "cid": "1436", "quid": "2063", "cityname": "海丰县"}, {
    "pid": "23",
    "cid": "1436",
    "quid": "2064",
    "cityname": "陆河县"
}, {"pid": "23", "cid": "693", "quid": "2065", "cityname": "紫金县"}, {
    "pid": "23",
    "cid": "693",
    "quid": "2066",
    "cityname": "连平县"
}, {"pid": "23", "cid": "693", "quid": "2067", "cityname": "东源县"}, {
    "pid": "23",
    "cid": "692",
    "quid": "2068",
    "cityname": "阳东县"
}, {"pid": "23", "cid": "1422", "quid": "2069", "cityname": "连州市"}, {
    "pid": "23",
    "cid": "1422",
    "quid": "2070",
    "cityname": "阳山县"
}, {"pid": "23", "cid": "1422", "quid": "2071", "cityname": "佛冈县"}, {
    "pid": "23",
    "cid": "1422",
    "quid": "2072",
    "cityname": "清新县"
}, {"pid": "23", "cid": "1422", "quid": "2073", "cityname": "连山县"}, {
    "pid": "23",
    "cid": "1422",
    "quid": "2074",
    "cityname": "连南"
}, {"pid": "23", "cid": "215", "quid": "2075", "cityname": "潮安县"}, {
    "pid": "23",
    "cid": "215",
    "quid": "2076",
    "cityname": "饶平县"
}, {"pid": "23", "cid": "956", "quid": "2077", "cityname": "揭东县"}, {
    "pid": "23",
    "cid": "956",
    "quid": "2078",
    "cityname": "揭西县"
}, {"pid": "23", "cid": "956", "quid": "2079", "cityname": "惠来县"}, {
    "pid": "23",
    "cid": "2036",
    "quid": "2080",
    "cityname": "云安县"
}, {"pid": "23", "cid": "2036", "quid": "2081", "cityname": "郁南县"}, {
    "pid": "23",
    "cid": "1436",
    "quid": "3007",
    "cityname": "东沙群岛"
}, {"pid": "23", "cid": "32", "quid": "10114", "cityname": "越秀区"}, {
    "pid": "23",
    "cid": "32",
    "quid": "10115",
    "cityname": "海珠区"
}, {"pid": "23", "cid": "32", "quid": "10116", "cityname": "荔湾区"}, {
    "pid": "23",
    "cid": "32",
    "quid": "10117",
    "cityname": "天河区"
}, {"pid": "23", "cid": "32", "quid": "10118", "cityname": "白云区"}, {
    "pid": "23",
    "cid": "32",
    "quid": "10119",
    "cityname": "黄埔区"
}, {"pid": "23", "cid": "32", "quid": "10120", "cityname": "花都区"}, {
    "pid": "23",
    "cid": "32",
    "quid": "10121",
    "cityname": "番禺区"
}, {"pid": "23", "cid": "32", "quid": "10122", "cityname": "南沙区"}, {
    "pid": "23",
    "cid": "32",
    "quid": "10123",
    "cityname": "萝岗区"
}, {"pid": "23", "cid": "30", "quid": "10124", "cityname": "福田区"}, {
    "pid": "23",
    "cid": "30",
    "quid": "10125",
    "cityname": "罗湖区"
}, {"pid": "23", "cid": "30", "quid": "10126", "cityname": "南山区"}, {
    "pid": "23",
    "cid": "30",
    "quid": "10127",
    "cityname": "宝安区"
}, {"pid": "23", "cid": "30", "quid": "10128", "cityname": "龙岗区"}, {
    "pid": "23",
    "cid": "30",
    "quid": "10129",
    "cityname": "盐田区"
}, {"pid": "23", "cid": "31", "quid": "10130", "cityname": "香洲区"}, {
    "pid": "23",
    "cid": "31",
    "quid": "10131",
    "cityname": "斗门区"
}, {"pid": "23", "cid": "31", "quid": "10132", "cityname": "金湾区"}, {
    "pid": "23",
    "cid": "447",
    "quid": "10133",
    "cityname": "金平区"
}, {"pid": "23", "cid": "447", "quid": "10134", "cityname": "龙湖区"}, {
    "pid": "23",
    "cid": "447",
    "quid": "10135",
    "cityname": "濠江区"
}, {"pid": "23", "cid": "447", "quid": "10138", "cityname": "潮南区"}, {
    "pid": "23",
    "cid": "422",
    "quid": "10139",
    "cityname": "浈江区"
}, {"pid": "23", "cid": "422", "quid": "10140", "cityname": "武江区"}, {
    "pid": "23",
    "cid": "422",
    "quid": "10141",
    "cityname": "曲江区"
}, {"pid": "23", "cid": "251", "quid": "10142", "cityname": "禅城区"}, {
    "pid": "23",
    "cid": "251",
    "quid": "10143",
    "cityname": "南海区"
}, {"pid": "23", "cid": "251", "quid": "10144", "cityname": "顺德区"}, {
    "pid": "23",
    "cid": "251",
    "quid": "10145",
    "cityname": "三水区"
}, {"pid": "23", "cid": "251", "quid": "10146", "cityname": "高明区"}, {
    "pid": "23",
    "cid": "316",
    "quid": "10147",
    "cityname": "江海区"
}, {"pid": "23", "cid": "316", "quid": "10148", "cityname": "蓬江区"}, {
    "pid": "23",
    "cid": "316",
    "quid": "10149",
    "cityname": "新会区"
}, {"pid": "23", "cid": "547", "quid": "10150", "cityname": "赤坎区"}, {
    "pid": "23",
    "cid": "547",
    "quid": "10151",
    "cityname": "霞山区"
}, {"pid": "23", "cid": "547", "quid": "10152", "cityname": "坡头区"}, {
    "pid": "23",
    "cid": "547",
    "quid": "10153",
    "cityname": "麻章区"
}, {"pid": "23", "cid": "1105", "quid": "10154", "cityname": "茂南区"}, {
    "pid": "23",
    "cid": "1105",
    "quid": "10155",
    "cityname": "茂港区"
}, {"pid": "23", "cid": "552", "quid": "10157", "cityname": "端州区"}, {
    "pid": "23",
    "cid": "552",
    "quid": "10158",
    "cityname": "鼎湖区"
}, {"pid": "23", "cid": "299", "quid": "10159", "cityname": "惠城区"}, {
    "pid": "23",
    "cid": "299",
    "quid": "10160",
    "cityname": "惠阳区"
}, {"pid": "23", "cid": "368", "quid": "10161", "cityname": "梅江区"}, {
    "pid": "23",
    "cid": "693",
    "quid": "10162",
    "cityname": "源城区"
}, {"pid": "23", "cid": "692", "quid": "10163", "cityname": "江城区"}, {
    "pid": "23",
    "cid": "1422",
    "quid": "10164",
    "cityname": "清城区"
}, {"pid": "23", "cid": "215", "quid": "10165", "cityname": "湘桥区"}, {
    "pid": "23",
    "cid": "956",
    "quid": "10166",
    "cityname": "榕城区"
}, {"pid": "23", "cid": "2036", "quid": "10167", "cityname": "云城区"}, {
    "pid": "23",
    "cid": "2036",
    "quid": "11909",
    "cityname": "云安县"
}, {"pid": "23", "cid": "2036", "quid": "11910", "cityname": "新兴县"}, {
    "pid": "23",
    "cid": "2036",
    "quid": "11912",
    "cityname": "罗定市"
}, {"pid": "23", "cid": "223", "quid": "22472", "cityname": "莞城街道"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22473",
    "cityname": "南城街道"
}, {"pid": "23", "cid": "223", "quid": "22474", "cityname": "东城街道"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22475",
    "cityname": "万江街道"
}, {"pid": "23", "cid": "223", "quid": "22476", "cityname": "石碣镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22477",
    "cityname": "石龙镇"
}, {"pid": "23", "cid": "223", "quid": "22478", "cityname": "茶山镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22479",
    "cityname": "石排镇"
}, {"pid": "23", "cid": "223", "quid": "22480", "cityname": "企石镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22481",
    "cityname": "桥头镇"
}, {"pid": "23", "cid": "223", "quid": "22482", "cityname": "谢岗镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22483",
    "cityname": "东坑镇"
}, {"pid": "23", "cid": "223", "quid": "22484", "cityname": "常平镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22485",
    "cityname": "寮步镇"
}, {"pid": "23", "cid": "223", "quid": "22486", "cityname": "大朗镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22487",
    "cityname": "黄江镇"
}, {"pid": "23", "cid": "223", "quid": "22488", "cityname": "清溪镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22489",
    "cityname": "塘厦镇"
}, {"pid": "23", "cid": "223", "quid": "22490", "cityname": "凤岗镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22491",
    "cityname": "长安镇"
}, {"pid": "23", "cid": "223", "quid": "22492", "cityname": "虎门镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22493",
    "cityname": "厚街镇"
}, {"pid": "23", "cid": "223", "quid": "22494", "cityname": "沙田镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22495",
    "cityname": "道滘镇"
}, {"pid": "23", "cid": "223", "quid": "22496", "cityname": "洪梅镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22497",
    "cityname": "麻涌镇"
}, {"pid": "23", "cid": "223", "quid": "22498", "cityname": "中堂镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22499",
    "cityname": "高埗镇"
}, {"pid": "23", "cid": "223", "quid": "22500", "cityname": "大岭山镇"}, {
    "pid": "23",
    "cid": "223",
    "quid": "22501",
    "cityname": "望牛墩镇"
}, {"pid": "23", "cid": "553", "quid": "22512", "cityname": "黄圃镇"}, {
    "pid": "23",
    "cid": "553",
    "quid": "22513",
    "cityname": "南头镇"
}, {"pid": "23", "cid": "553", "quid": "22514", "cityname": "东凤镇"}, {
    "pid": "23",
    "cid": "31",
    "quid": "22537",
    "cityname": "横琴新区"
}, {"pid": "23", "cid": "299", "quid": "22594", "cityname": "大亚湾"}, {
    "pid": "24",
    "cid": "1531",
    "quid": "396",
    "cityname": "凭祥市"
}, {"pid": "24", "cid": "33", "quid": "871", "cityname": "阳朔县"}, {
    "pid": "24",
    "cid": "33",
    "quid": "971",
    "cityname": "全州县"
}, {"pid": "24", "cid": "2082", "quid": "972", "cityname": "金城江"}, {
    "pid": "24",
    "cid": "1140",
    "quid": "1141",
    "cityname": "平果县"
}, {"pid": "24", "cid": "1531", "quid": "1480", "cityname": "天等县"}, {
    "pid": "24",
    "cid": "1531",
    "quid": "1481",
    "cityname": "扶绥县"
}, {"pid": "24", "cid": "1531", "quid": "1482", "cityname": "大新县"}, {
    "pid": "24",
    "cid": "1531",
    "quid": "1483",
    "cityname": "龙州县"
}, {"pid": "24", "cid": "1531", "quid": "1484", "cityname": "宁明县"}, {
    "pid": "24",
    "cid": "33",
    "quid": "1526",
    "cityname": "龙胜各族自治县"
}, {"pid": "24", "cid": "380", "quid": "2083", "cityname": "宾阳县"}, {
    "pid": "24",
    "cid": "380",
    "quid": "2084",
    "cityname": "邕宁县"
}, {"pid": "24", "cid": "380", "quid": "2085", "cityname": "武鸣县"}, {
    "pid": "24",
    "cid": "380",
    "quid": "2086",
    "cityname": "隆安县"
}, {"pid": "24", "cid": "380", "quid": "2087", "cityname": "马山县"}, {
    "pid": "24",
    "cid": "380",
    "quid": "2088",
    "cityname": "上林县"
}, {"pid": "24", "cid": "380", "quid": "2089", "cityname": "横县"}, {
    "pid": "24",
    "cid": "354",
    "quid": "2090",
    "cityname": "柳江县"
}, {"pid": "24", "cid": "354", "quid": "2091", "cityname": "柳城县"}, {
    "pid": "24",
    "cid": "354",
    "quid": "2092",
    "cityname": "鹿寨县"
}, {"pid": "24", "cid": "354", "quid": "2093", "cityname": "融安县"}, {
    "pid": "24",
    "cid": "354",
    "quid": "2094",
    "cityname": "融水"
}, {"pid": "24", "cid": "354", "quid": "2095", "cityname": "三江"}, {
    "pid": "24",
    "cid": "33",
    "quid": "2096",
    "cityname": "临桂县"
}, {"pid": "24", "cid": "33", "quid": "2097", "cityname": "灵川县"}, {
    "pid": "24",
    "cid": "33",
    "quid": "2098",
    "cityname": "平乐县"
}, {"pid": "24", "cid": "33", "quid": "2099", "cityname": "兴安县"}, {
    "pid": "24",
    "cid": "33",
    "quid": "2100",
    "cityname": "灌阳县"
}, {"pid": "24", "cid": "33", "quid": "2101", "cityname": "荔浦县"}, {
    "pid": "24",
    "cid": "33",
    "quid": "2102",
    "cityname": "资源县"
}, {"pid": "24", "cid": "33", "quid": "2103", "cityname": "永福县"}, {
    "pid": "24",
    "cid": "33",
    "quid": "2104",
    "cityname": "恭城瑶族自治县"
}, {"pid": "24", "cid": "492", "quid": "2105", "cityname": "岑溪市"}, {
    "pid": "24",
    "cid": "492",
    "quid": "2106",
    "cityname": "苍梧县"
}, {"pid": "24", "cid": "492", "quid": "2107", "cityname": "藤县"}, {
    "pid": "24",
    "cid": "492",
    "quid": "2108",
    "cityname": "蒙山县"
}, {"pid": "24", "cid": "189", "quid": "2109", "cityname": "合浦县"}, {
    "pid": "24",
    "cid": "2110",
    "quid": "2111",
    "cityname": "东兴市"
}, {"pid": "24", "cid": "2110", "quid": "2112", "cityname": "上思县"}, {
    "pid": "24",
    "cid": "2113",
    "quid": "2114",
    "cityname": "灵山县"
}, {"pid": "24", "cid": "2113", "quid": "2115", "cityname": "浦北县"}, {
    "pid": "24",
    "cid": "2116",
    "quid": "2117",
    "cityname": "桂平市"
}, {"pid": "24", "cid": "2116", "quid": "2118", "cityname": "平南县"}, {
    "pid": "24",
    "cid": "1113",
    "quid": "2119",
    "cityname": "北流市"
}, {"pid": "24", "cid": "1113", "quid": "2120", "cityname": "容县"}, {
    "pid": "24",
    "cid": "1113",
    "quid": "2121",
    "cityname": "陆川县"
}, {"pid": "24", "cid": "1113", "quid": "2122", "cityname": "博白县"}, {
    "pid": "24",
    "cid": "1113",
    "quid": "2123",
    "cityname": "兴业县"
}, {"pid": "24", "cid": "1140", "quid": "2124", "cityname": "凌云县"}, {
    "pid": "24",
    "cid": "1140",
    "quid": "2125",
    "cityname": "西林县"
}, {"pid": "24", "cid": "1140", "quid": "2126", "cityname": "乐业县"}, {
    "pid": "24",
    "cid": "1140",
    "quid": "2127",
    "cityname": "德保县"
}, {"pid": "24", "cid": "1140", "quid": "2128", "cityname": "田林县"}, {
    "pid": "24",
    "cid": "1140",
    "quid": "2129",
    "cityname": "田阳县"
}, {"pid": "24", "cid": "1140", "quid": "2130", "cityname": "靖西县"}, {
    "pid": "24",
    "cid": "1140",
    "quid": "2131",
    "cityname": "隆林"
}, {"pid": "24", "cid": "2132", "quid": "2133", "cityname": "钟山县"}, {
    "pid": "24",
    "cid": "2132",
    "quid": "2134",
    "cityname": "昭平县"
}, {"pid": "24", "cid": "2132", "quid": "2135", "cityname": "富川"}, {
    "pid": "24",
    "cid": "2082",
    "quid": "2136",
    "cityname": "宜州市"
}, {"pid": "24", "cid": "2082", "quid": "2137", "cityname": "天峨县"}, {
    "pid": "24",
    "cid": "2082",
    "quid": "2138",
    "cityname": "凤山县"
}, {"pid": "24", "cid": "2082", "quid": "2139", "cityname": "南丹县"}, {
    "pid": "24",
    "cid": "2082",
    "quid": "2140",
    "cityname": "东兰县"
}, {"pid": "24", "cid": "2082", "quid": "2141", "cityname": "都安"}, {
    "pid": "24",
    "cid": "2082",
    "quid": "2142",
    "cityname": "罗城"
}, {"pid": "24", "cid": "2082", "quid": "2143", "cityname": "巴马"}, {
    "pid": "24",
    "cid": "2082",
    "quid": "2144",
    "cityname": "环江"
}, {"pid": "24", "cid": "2082", "quid": "2145", "cityname": "大化"}, {
    "pid": "24",
    "cid": "2146",
    "quid": "2147",
    "cityname": "合山市"
}, {"pid": "24", "cid": "2146", "quid": "2148", "cityname": "象州县"}, {
    "pid": "24",
    "cid": "2146",
    "quid": "2149",
    "cityname": "武宣县"
}, {"pid": "24", "cid": "2146", "quid": "2150", "cityname": "忻城县"}, {
    "pid": "24",
    "cid": "2146",
    "quid": "2151",
    "cityname": "金秀"
}, {"pid": "24", "cid": "380", "quid": "10080", "cityname": "青秀区"}, {
    "pid": "24",
    "cid": "380",
    "quid": "10081",
    "cityname": "兴宁区"
}, {"pid": "24", "cid": "380", "quid": "10082", "cityname": "西乡塘区"}, {
    "pid": "24",
    "cid": "380",
    "quid": "10083",
    "cityname": "良庆区"
}, {"pid": "24", "cid": "380", "quid": "10084", "cityname": "江南区"}, {
    "pid": "24",
    "cid": "380",
    "quid": "10085",
    "cityname": "邕宁区"
}, {"pid": "24", "cid": "354", "quid": "10086", "cityname": "城中区"}, {
    "pid": "24",
    "cid": "354",
    "quid": "10087",
    "cityname": "鱼峰区"
}, {"pid": "24", "cid": "354", "quid": "10088", "cityname": "柳北区"}, {
    "pid": "24",
    "cid": "354",
    "quid": "10089",
    "cityname": "柳南区"
}, {"pid": "24", "cid": "33", "quid": "10090", "cityname": "秀峰区"}, {
    "pid": "24",
    "cid": "33",
    "quid": "10091",
    "cityname": "叠彩区"
}, {"pid": "24", "cid": "33", "quid": "10092", "cityname": "象山区"}, {
    "pid": "24",
    "cid": "33",
    "quid": "10093",
    "cityname": "七星区"
}, {"pid": "24", "cid": "33", "quid": "10094", "cityname": "雁山区"}, {
    "pid": "24",
    "cid": "492",
    "quid": "10095",
    "cityname": "万秀区"
}, {"pid": "24", "cid": "492", "quid": "10096", "cityname": "蝶山区"}, {
    "pid": "24",
    "cid": "492",
    "quid": "10097",
    "cityname": "长洲区"
}, {"pid": "24", "cid": "189", "quid": "10098", "cityname": "海城区"}, {
    "pid": "24",
    "cid": "189",
    "quid": "10099",
    "cityname": "银海区"
}, {"pid": "24", "cid": "189", "quid": "10100", "cityname": "铁山港区"}, {
    "pid": "24",
    "cid": "2110",
    "quid": "10101",
    "cityname": "港口区"
}, {"pid": "24", "cid": "2110", "quid": "10102", "cityname": "防城区"}, {
    "pid": "24",
    "cid": "2113",
    "quid": "10103",
    "cityname": "钦南区"
}, {"pid": "24", "cid": "2113", "quid": "10104", "cityname": "钦北区"}, {
    "pid": "24",
    "cid": "2116",
    "quid": "10105",
    "cityname": "港北区"
}, {"pid": "24", "cid": "2116", "quid": "10106", "cityname": "港南区"}, {
    "pid": "24",
    "cid": "2116",
    "quid": "10107",
    "cityname": "覃塘区"
}, {"pid": "24", "cid": "1113", "quid": "10108", "cityname": "玉州区"}, {
    "pid": "24",
    "cid": "1140",
    "quid": "10109",
    "cityname": "右江区"
}, {"pid": "24", "cid": "2132", "quid": "10110", "cityname": "八步区"}, {
    "pid": "24",
    "cid": "2082",
    "quid": "10111",
    "cityname": "八步区"
}, {"pid": "24", "cid": "2146", "quid": "10112", "cityname": "兴宾区"}, {
    "pid": "24",
    "cid": "1531",
    "quid": "10113",
    "cityname": "江州区"
}, {"pid": "24", "cid": "1113", "quid": "19901", "cityname": "福绵区"}, {
    "pid": "24",
    "cid": "2116",
    "quid": "21712",
    "cityname": "桥虚镇"
}, {"pid": "24", "cid": "189", "quid": "22518", "cityname": "涠洲岛"}, {
    "pid": "24",
    "cid": "380",
    "quid": "22520",
    "cityname": "高新区"
}, {"pid": "25", "cid": "35", "quid": "309", "cityname": "景洪市"}, {
    "pid": "25",
    "cid": "365",
    "quid": "412",
    "cityname": "瑞丽市"
}, {"pid": "25", "cid": "34", "quid": "431", "cityname": "石林彝族自治县"}, {
    "pid": "25",
    "cid": "93",
    "quid": "660",
    "cityname": "香格里拉县"
}, {"pid": "25", "cid": "34", "quid": "661", "cityname": "路南石林"}, {
    "pid": "25",
    "cid": "985",
    "quid": "869",
    "cityname": "罗平县"
}, {"pid": "25", "cid": "985", "quid": "984", "cityname": "宣威市"}, {
    "pid": "25",
    "cid": "37",
    "quid": "1161",
    "cityname": "泸沽湖[宁蒗县]"
}, {"pid": "25", "cid": "1341", "quid": "1304", "cityname": "蒙自县"}, {
    "pid": "25",
    "cid": "1341",
    "quid": "1330",
    "cityname": "石屏县"
}, {"pid": "25", "cid": "1341", "quid": "1333", "cityname": "开远市"}, {
    "pid": "25",
    "cid": "365",
    "quid": "1492",
    "cityname": "畹町"
}, {"pid": "25", "cid": "435", "quid": "1534", "cityname": "普洱"}, {
    "pid": "25",
    "cid": "1341",
    "quid": "1554",
    "cityname": "泸西县"
}, {"pid": "25", "cid": "1341", "quid": "1555", "cityname": "弥勒县"}, {
    "pid": "25",
    "cid": "1341",
    "quid": "1556",
    "cityname": "河口"
}, {"pid": "25", "cid": "1341", "quid": "1557", "cityname": "建水县"}, {
    "pid": "25",
    "cid": "365",
    "quid": "1559",
    "cityname": "潞西市"
}, {"pid": "25", "cid": "365", "quid": "1560", "cityname": "盈江县"}, {
    "pid": "25",
    "cid": "365",
    "quid": "1561",
    "cityname": "陇川县"
}, {"pid": "25", "cid": "36", "quid": "1562", "cityname": "宾川县"}, {
    "pid": "25",
    "cid": "1341",
    "quid": "1578",
    "cityname": "个旧市"
}, {"pid": "25", "cid": "2974", "quid": "1579", "cityname": "泸水县"}, {
    "pid": "25",
    "cid": "2974",
    "quid": "2975",
    "cityname": "福贡县"
}, {"pid": "25", "cid": "2974", "quid": "2976", "cityname": "兰坪白族普米族自治县"}, {
    "pid": "25",
    "cid": "2974",
    "quid": "2977",
    "cityname": "贡山独龙族怒族自治县"
}, {"pid": "25", "cid": "93", "quid": "2978", "cityname": "德钦县"}, {
    "pid": "25",
    "cid": "93",
    "quid": "2979",
    "cityname": "维西傈僳族自治县"
}, {"pid": "25", "cid": "365", "quid": "2980", "cityname": "梁河县"}, {
    "pid": "25",
    "cid": "2982",
    "quid": "2981",
    "cityname": "楚雄市"
}, {"pid": "25", "cid": "2982", "quid": "2983", "cityname": "元谋县"}, {
    "pid": "25",
    "cid": "35",
    "quid": "2984",
    "cityname": "勐腊县"
}, {"pid": "25", "cid": "34", "quid": "2985", "cityname": "安宁市"}, {
    "pid": "25",
    "cid": "34",
    "quid": "2986",
    "cityname": "富民县"
}, {"pid": "25", "cid": "34", "quid": "2987", "cityname": "嵩明县"}, {
    "pid": "25",
    "cid": "34",
    "quid": "2988",
    "cityname": "呈贡区"
}, {"pid": "25", "cid": "34", "quid": "2989", "cityname": "晋宁县"}, {
    "pid": "25",
    "cid": "34",
    "quid": "2990",
    "cityname": "宜良县"
}, {"pid": "25", "cid": "34", "quid": "2991", "cityname": "禄劝彝族苗族自治县"}, {
    "pid": "25",
    "cid": "34",
    "quid": "2992",
    "cityname": "寻甸回族彝族自治县"
}, {"pid": "25", "cid": "37", "quid": "3133", "cityname": "华坪县"}, {
    "pid": "25",
    "cid": "37",
    "quid": "3134",
    "cityname": "永胜县"
}, {"pid": "25", "cid": "37", "quid": "3135", "cityname": "玉龙纳西族自治县"}, {
    "pid": "25",
    "cid": "35",
    "quid": "3136",
    "cityname": "勐海县"
}, {"pid": "25", "cid": "1341", "quid": "3137", "cityname": "绿春县"}, {
    "pid": "25",
    "cid": "1341",
    "quid": "3138",
    "cityname": "元阳县"
}, {"pid": "25", "cid": "1341", "quid": "3139", "cityname": "金平苗族瑶族傣族自治县"}, {
    "pid": "25",
    "cid": "1341",
    "quid": "3141",
    "cityname": "屏边苗族自治县"
}, {"pid": "25", "cid": "435", "quid": "3142", "cityname": "景东彝族自治县"}, {
    "pid": "25",
    "cid": "435",
    "quid": "3143",
    "cityname": "镇沅彝族哈尼族拉祜族自治县"
}, {"pid": "25", "cid": "435", "quid": "3144", "cityname": "景谷彝族傣族自治县"}, {
    "pid": "25",
    "cid": "435",
    "quid": "3145",
    "cityname": "墨江哈尼族自治县"
}, {"pid": "25", "cid": "435", "quid": "3146", "cityname": "澜沧拉祜族自治县"}, {
    "pid": "25",
    "cid": "435",
    "quid": "3147",
    "cityname": "西盟佤族自治县"
}, {"pid": "25", "cid": "435", "quid": "3148", "cityname": "江城哈尼族彝族自治县"}, {
    "pid": "25",
    "cid": "435",
    "quid": "3149",
    "cityname": "孟连傣族拉祜族佤族自治县"
}, {"pid": "25", "cid": "555", "quid": "3150", "cityname": "永善县"}, {
    "pid": "25",
    "cid": "555",
    "quid": "3151",
    "cityname": "绥江县"
}, {"pid": "25", "cid": "555", "quid": "3152", "cityname": "镇雄县"}, {
    "pid": "25",
    "cid": "555",
    "quid": "3153",
    "cityname": "大关县"
}, {"pid": "25", "cid": "555", "quid": "3154", "cityname": "盐津县"}, {
    "pid": "25",
    "cid": "555",
    "quid": "3155",
    "cityname": "巧家县"
}, {"pid": "25", "cid": "555", "quid": "3156", "cityname": "彝良县"}, {
    "pid": "25",
    "cid": "555",
    "quid": "3157",
    "cityname": "威信县"
}, {"pid": "25", "cid": "555", "quid": "3158", "cityname": "水富县"}, {
    "pid": "25",
    "cid": "555",
    "quid": "3159",
    "cityname": "鲁甸县"
}, {"pid": "25", "cid": "985", "quid": "3160", "cityname": "陆良县"}, {
    "pid": "25",
    "cid": "985",
    "quid": "3161",
    "cityname": "会泽县"
}, {"pid": "25", "cid": "985", "quid": "3162", "cityname": "富源县"}, {
    "pid": "25",
    "cid": "985",
    "quid": "3163",
    "cityname": "马龙县"
}, {"pid": "25", "cid": "985", "quid": "3164", "cityname": "师宗县"}, {
    "pid": "25",
    "cid": "985",
    "quid": "3165",
    "cityname": "沾益县"
}, {"pid": "25", "cid": "1236", "quid": "3166", "cityname": "镇康县"}, {
    "pid": "25",
    "cid": "1236",
    "quid": "3167",
    "cityname": "凤庆县"
}, {"pid": "25", "cid": "1236", "quid": "3168", "cityname": "云县"}, {
    "pid": "25",
    "cid": "1236",
    "quid": "3169",
    "cityname": "永德县"
}, {"pid": "25", "cid": "1236", "quid": "3170", "cityname": "双江拉祜族佤族布朗族傣族自治县"}, {
    "pid": "25",
    "cid": "1236",
    "quid": "3171",
    "cityname": "沧源佤族自治县"
}, {"pid": "25", "cid": "1236", "quid": "3172", "cityname": "耿马傣族佤族治县"}, {
    "pid": "25",
    "cid": "186",
    "quid": "3173",
    "cityname": "红塔区"
}, {"pid": "25", "cid": "186", "quid": "3174", "cityname": "华宁县"}, {
    "pid": "25",
    "cid": "186",
    "quid": "3175",
    "cityname": "澄江县"
}, {"pid": "25", "cid": "186", "quid": "3176", "cityname": "易门县"}, {
    "pid": "25",
    "cid": "186",
    "quid": "3177",
    "cityname": "通海县"
}, {"pid": "25", "cid": "186", "quid": "3178", "cityname": "江川县"}, {
    "pid": "25",
    "cid": "186",
    "quid": "3179",
    "cityname": "元江哈尼族彝族傣族自治县"
}, {"pid": "25", "cid": "186", "quid": "3180", "cityname": "新平彝族傣族自治县"}, {
    "pid": "25",
    "cid": "186",
    "quid": "3181",
    "cityname": "峨山彝族自治县"
}, {"pid": "25", "cid": "197", "quid": "3182", "cityname": "施甸县"}, {
    "pid": "25",
    "cid": "197",
    "quid": "3183",
    "cityname": "昌宁县"
}, {"pid": "25", "cid": "197", "quid": "3184", "cityname": "龙陵县"}, {
    "pid": "25",
    "cid": "197",
    "quid": "3185",
    "cityname": "腾冲县"
}, {"pid": "25", "cid": "2982", "quid": "3186", "cityname": "南华县"}, {
    "pid": "25",
    "cid": "2982",
    "quid": "3187",
    "cityname": "牟定县"
}, {"pid": "25", "cid": "2982", "quid": "3188", "cityname": "武定县"}, {
    "pid": "25",
    "cid": "2982",
    "quid": "3189",
    "cityname": "大姚县"
}, {"pid": "25", "cid": "2982", "quid": "3190", "cityname": "双柏县"}, {
    "pid": "25",
    "cid": "2982",
    "quid": "3191",
    "cityname": "禄丰县"
}, {"pid": "25", "cid": "2982", "quid": "3192", "cityname": "永仁县"}, {
    "pid": "25",
    "cid": "2982",
    "quid": "3193",
    "cityname": "姚安县"
}, {"pid": "25", "cid": "1342", "quid": "3194", "cityname": "麻栗坡县"}, {
    "pid": "25",
    "cid": "1342",
    "quid": "3195",
    "cityname": "砚山县"
}, {"pid": "25", "cid": "1342", "quid": "3196", "cityname": "广南县"}, {
    "pid": "25",
    "cid": "1342",
    "quid": "3197",
    "cityname": "马关县"
}, {"pid": "25", "cid": "1342", "quid": "3198", "cityname": "富宁县"}, {
    "pid": "25",
    "cid": "1342",
    "quid": "3199",
    "cityname": "西畴县"
}, {"pid": "25", "cid": "1342", "quid": "3200", "cityname": "丘北县"}, {
    "pid": "25",
    "cid": "36",
    "quid": "3201",
    "cityname": "剑川县"
}, {"pid": "25", "cid": "36", "quid": "3202", "cityname": "弥渡县"}, {
    "pid": "25",
    "cid": "36",
    "quid": "3203",
    "cityname": "云龙县"
}, {"pid": "25", "cid": "36", "quid": "3204", "cityname": "洱源县"}, {
    "pid": "25",
    "cid": "36",
    "quid": "3205",
    "cityname": "鹤庆县"
}, {"pid": "25", "cid": "36", "quid": "3206", "cityname": "祥云县"}, {
    "pid": "25",
    "cid": "36",
    "quid": "3207",
    "cityname": "永平县"
}, {"pid": "25", "cid": "36", "quid": "3208", "cityname": "漾濞彝族自治县"}, {
    "pid": "25",
    "cid": "36",
    "quid": "3209",
    "cityname": "巍山彝族回族自治县"
}, {"pid": "25", "cid": "36", "quid": "3210", "cityname": "南涧彝族自治县"}, {
    "pid": "25",
    "cid": "2974",
    "quid": "3833",
    "cityname": "三江并流区"
}, {"pid": "25", "cid": "34", "quid": "9916", "cityname": "盘龙区"}, {
    "pid": "25",
    "cid": "34",
    "quid": "9917",
    "cityname": "五华区"
}, {"pid": "25", "cid": "34", "quid": "9918", "cityname": "官渡区"}, {
    "pid": "25",
    "cid": "34",
    "quid": "9919",
    "cityname": "西山区"
}, {"pid": "25", "cid": "34", "quid": "9920", "cityname": "东川区"}, {
    "pid": "25",
    "cid": "985",
    "quid": "9921",
    "cityname": "麒麟区"
}, {"pid": "25", "cid": "186", "quid": "9922", "cityname": "红塔区"}, {
    "pid": "25",
    "cid": "197",
    "quid": "9923",
    "cityname": "隆阳区"
}, {"pid": "25", "cid": "555", "quid": "9924", "cityname": "昭阳区"}, {
    "pid": "25",
    "cid": "37",
    "quid": "9925",
    "cityname": "古城区(大研镇)"
}, {"pid": "25", "cid": "435", "quid": "9926", "cityname": "翠云区"}, {
    "pid": "25",
    "cid": "1236",
    "quid": "9927",
    "cityname": "临翔区(凤翔镇)"
}, {"pid": "25", "cid": "37", "quid": "11922", "cityname": "丽江北部景区"}, {
    "pid": "25",
    "cid": "34",
    "quid": "22515",
    "cityname": "滇池"
}, {"pid": "25", "cid": "37", "quid": "22533", "cityname": "盐源县"}, {
    "pid": "25",
    "cid": "36",
    "quid": "22536",
    "cityname": "大理市"
}, {"pid": "26", "cid": "975", "quid": "976", "cityname": "贵定县"}, {
    "pid": "26",
    "cid": "605",
    "quid": "980",
    "cityname": "六枝特区"
}, {"pid": "26", "cid": "1227", "quid": "982", "cityname": "玉屏"}, {
    "pid": "26",
    "cid": "558",
    "quid": "983",
    "cityname": "桐梓县"
}, {"pid": "26", "cid": "333", "quid": "986", "cityname": "镇远县"}, {
    "pid": "26",
    "cid": "975",
    "quid": "1114",
    "cityname": "独山县"
}, {"pid": "26", "cid": "333", "quid": "1784", "cityname": "黄平县"}, {
    "pid": "26",
    "cid": "975",
    "quid": "1785",
    "cityname": "荔波县"
}, {"pid": "26", "cid": "558", "quid": "1786", "cityname": "赤水市"}, {
    "pid": "26",
    "cid": "38",
    "quid": "2256",
    "cityname": "清镇市"
}, {"pid": "26", "cid": "38", "quid": "2257", "cityname": "开阳县"}, {
    "pid": "26",
    "cid": "38",
    "quid": "2258",
    "cityname": "修文县"
}, {"pid": "26", "cid": "38", "quid": "2259", "cityname": "息烽县"}, {
    "pid": "26",
    "cid": "605",
    "quid": "2260",
    "cityname": "水城县"
}, {"pid": "26", "cid": "605", "quid": "2261", "cityname": "盘县"}, {
    "pid": "26",
    "cid": "558",
    "quid": "2262",
    "cityname": "仁怀市"
}, {"pid": "26", "cid": "558", "quid": "2263", "cityname": "遵义县"}, {
    "pid": "26",
    "cid": "558",
    "quid": "2264",
    "cityname": "绥阳县"
}, {"pid": "26", "cid": "558", "quid": "2265", "cityname": "习水县"}, {
    "pid": "26",
    "cid": "558",
    "quid": "2266",
    "cityname": "凤冈县"
}, {"pid": "26", "cid": "558", "quid": "2267", "cityname": "正安县"}, {
    "pid": "26",
    "cid": "558",
    "quid": "2268",
    "cityname": "余庆县"
}, {"pid": "26", "cid": "558", "quid": "2269", "cityname": "湄潭县"}, {
    "pid": "26",
    "cid": "558",
    "quid": "2270",
    "cityname": "道真"
}, {"pid": "26", "cid": "558", "quid": "2271", "cityname": "务川仡佬族苗族自治县"}, {
    "pid": "26",
    "cid": "179",
    "quid": "2272",
    "cityname": "普定县"
}, {"pid": "26", "cid": "179", "quid": "2273", "cityname": "平坝县"}, {
    "pid": "26",
    "cid": "179",
    "quid": "2274",
    "cityname": "镇宁布依族苗族自治县"
}, {"pid": "26", "cid": "179", "quid": "2275", "cityname": "紫云苗族布依族自治县"}, {
    "pid": "26",
    "cid": "179",
    "quid": "2276",
    "cityname": "关岭布依族苗族自治县"
}, {"pid": "26", "cid": "1227", "quid": "2277", "cityname": "德江县"}, {
    "pid": "26",
    "cid": "1227",
    "quid": "2278",
    "cityname": "江口县"
}, {"pid": "26", "cid": "1227", "quid": "2279", "cityname": "思南县"}, {
    "pid": "26",
    "cid": "1227",
    "quid": "2280",
    "cityname": "石阡县"
}, {"pid": "26", "cid": "1227", "quid": "2281", "cityname": "松桃苗族自治县"}, {
    "pid": "26",
    "cid": "1227",
    "quid": "2282",
    "cityname": "印江土家族苗族县"
}, {"pid": "26", "cid": "1227", "quid": "2283", "cityname": "沿河土家族自治县"}, {
    "pid": "26",
    "cid": "1227",
    "quid": "2284",
    "cityname": "万山特区"
}, {"pid": "26", "cid": "2285", "quid": "2286", "cityname": "黔西县"}, {
    "pid": "26",
    "cid": "2285",
    "quid": "2287",
    "cityname": "大方县"
}, {"pid": "26", "cid": "2285", "quid": "2288", "cityname": "织金县"}, {
    "pid": "26",
    "cid": "2285",
    "quid": "2289",
    "cityname": "金沙县"
}, {"pid": "26", "cid": "2285", "quid": "2290", "cityname": "赫章县"}, {
    "pid": "26",
    "cid": "2285",
    "quid": "2291",
    "cityname": "纳雍县"
}, {"pid": "26", "cid": "2285", "quid": "2292", "cityname": "威宁彝族回族苗族县"}, {
    "pid": "26",
    "cid": "1139",
    "quid": "2293",
    "cityname": "望谟县"
}, {"pid": "26", "cid": "1139", "quid": "2294", "cityname": "兴仁县"}, {
    "pid": "26",
    "cid": "1139",
    "quid": "2295",
    "cityname": "普安县"
}, {"pid": "26", "cid": "1139", "quid": "2296", "cityname": "册亨县"}, {
    "pid": "26",
    "cid": "1139",
    "quid": "2297",
    "cityname": "晴隆县"
}, {"pid": "26", "cid": "1139", "quid": "2298", "cityname": "贞丰县"}, {
    "pid": "26",
    "cid": "1139",
    "quid": "2299",
    "cityname": "安龙县"
}, {"pid": "26", "cid": "333", "quid": "2300", "cityname": "施秉县"}, {
    "pid": "26",
    "cid": "333",
    "quid": "2301",
    "cityname": "从江县"
}, {"pid": "26", "cid": "333", "quid": "2302", "cityname": "锦屏县"}, {
    "pid": "26",
    "cid": "333",
    "quid": "2303",
    "cityname": "麻江县"
}, {"pid": "26", "cid": "333", "quid": "2304", "cityname": "台江县"}, {
    "pid": "26",
    "cid": "333",
    "quid": "2305",
    "cityname": "天柱县"
}, {"pid": "26", "cid": "333", "quid": "2306", "cityname": "榕江县"}, {
    "pid": "26",
    "cid": "333",
    "quid": "2307",
    "cityname": "剑河县"
}, {"pid": "26", "cid": "333", "quid": "2308", "cityname": "三穗县"}, {
    "pid": "26",
    "cid": "333",
    "quid": "2309",
    "cityname": "雷山县"
}, {"pid": "26", "cid": "333", "quid": "2310", "cityname": "黎平县"}, {
    "pid": "26",
    "cid": "1227",
    "quid": "2311",
    "cityname": "岑巩县"
}, {"pid": "26", "cid": "333", "quid": "2312", "cityname": "丹寨县"}, {
    "pid": "26",
    "cid": "975",
    "quid": "2313",
    "cityname": "福泉市"
}, {"pid": "26", "cid": "975", "quid": "2314", "cityname": "惠水县"}, {
    "pid": "26",
    "cid": "975",
    "quid": "2315",
    "cityname": "罗甸县"
}, {"pid": "26", "cid": "975", "quid": "2316", "cityname": "瓮安县"}, {
    "pid": "26",
    "cid": "975",
    "quid": "2317",
    "cityname": "龙里县"
}, {"pid": "26", "cid": "975", "quid": "2318", "cityname": "平塘县"}, {
    "pid": "26",
    "cid": "975",
    "quid": "2319",
    "cityname": "长顺县"
}, {"pid": "26", "cid": "975", "quid": "2320", "cityname": "三都水族自治县"}, {
    "pid": "26",
    "cid": "38",
    "quid": "9928",
    "cityname": "南明区"
}, {"pid": "26", "cid": "38", "quid": "9929", "cityname": "云岩区"}, {
    "pid": "26",
    "cid": "38",
    "quid": "9930",
    "cityname": "花溪区"
}, {"pid": "26", "cid": "38", "quid": "9931", "cityname": "乌当区"}, {
    "pid": "26",
    "cid": "38",
    "quid": "9932",
    "cityname": "白云区"
}, {"pid": "26", "cid": "38", "quid": "9933", "cityname": "小河区"}, {
    "pid": "26",
    "cid": "605",
    "quid": "9934",
    "cityname": "钟山区"
}, {"pid": "26", "cid": "558", "quid": "9935", "cityname": "红花岗区"}, {
    "pid": "26",
    "cid": "558",
    "quid": "9936",
    "cityname": "汇川区"
}, {"pid": "26", "cid": "179", "quid": "9937", "cityname": "西秀区"}, {
    "pid": "26",
    "cid": "1227",
    "quid": "11842",
    "cityname": "十里锦江"
}, {"pid": "26", "cid": "333", "quid": "22575", "cityname": "市区"}, {
    "pid": "26",
    "cid": "179",
    "quid": "22581",
    "cityname": "开发区"
}, {"pid": "26", "cid": "38", "quid": "22582", "cityname": "金阳新区"}, {
    "pid": "26",
    "cid": "333",
    "quid": "22586",
    "cityname": "西江"
}, {"pid": "27", "cid": "1508", "quid": "125", "cityname": "都兰县"}, {
    "pid": "27",
    "cid": "1508",
    "quid": "132",
    "cityname": "格尔木市"
}, {"pid": "27", "cid": "1508", "quid": "1509", "cityname": "乌兰县"}, {
    "pid": "27",
    "cid": "1508",
    "quid": "1510",
    "cityname": "天峻县"
}, {"pid": "27", "cid": "1508", "quid": "1511", "cityname": "大柴旦"}, {
    "pid": "27",
    "cid": "1508",
    "quid": "1512",
    "cityname": "茫崖行委"
}, {"pid": "27", "cid": "1508", "quid": "1513", "cityname": "冷湖行委"}, {
    "pid": "27",
    "cid": "1651",
    "quid": "1652",
    "cityname": "杂多县"
}, {"pid": "27", "cid": "1651", "quid": "1653", "cityname": "蘘谦县"}, {
    "pid": "27",
    "cid": "1651",
    "quid": "1654",
    "cityname": "曲麻莱县"
}, {"pid": "27", "cid": "1651", "quid": "1655", "cityname": "称多县"}, {
    "pid": "27",
    "cid": "1651",
    "quid": "1656",
    "cityname": "治多县"
}, {"pid": "27", "cid": "1659", "quid": "1657", "cityname": "玛多县"}, {
    "pid": "27",
    "cid": "1659",
    "quid": "1658",
    "cityname": "达日县"
}, {"pid": "27", "cid": "1659", "quid": "1660", "cityname": "甘德县"}, {
    "pid": "27",
    "cid": "1659",
    "quid": "1661",
    "cityname": "久治县"
}, {"pid": "27", "cid": "1659", "quid": "1662", "cityname": "班玛县"}, {
    "pid": "27",
    "cid": "371",
    "quid": "1663",
    "cityname": "祁连县"
}, {"pid": "27", "cid": "3882", "quid": "1664", "cityname": "青海湖"}, {
    "pid": "27",
    "cid": "3882",
    "quid": "1665",
    "cityname": "同德县"
}, {"pid": "27", "cid": "3882", "quid": "1666", "cityname": "兴海县"}, {
    "pid": "27",
    "cid": "1669",
    "quid": "1667",
    "cityname": "河南县"
}, {"pid": "27", "cid": "1669", "quid": "1668", "cityname": "泽库县"}, {
    "pid": "27",
    "cid": "1020",
    "quid": "1670",
    "cityname": "循化"
}, {"pid": "27", "cid": "1020", "quid": "1671", "cityname": "化隆"}, {
    "pid": "27",
    "cid": "1669",
    "quid": "1672",
    "cityname": "尖扎县"
}, {"pid": "27", "cid": "1020", "quid": "1673", "cityname": "民和"}, {
    "pid": "27",
    "cid": "124",
    "quid": "1674",
    "cityname": "湟中县"
}, {"pid": "27", "cid": "124", "quid": "1675", "cityname": "湟源县"}, {
    "pid": "27",
    "cid": "371",
    "quid": "1676",
    "cityname": "门源"
}, {"pid": "27", "cid": "3882", "quid": "1677", "cityname": "贵德县"}, {
    "pid": "27",
    "cid": "3882",
    "quid": "1678",
    "cityname": "贵南县"
}, {"pid": "27", "cid": "1020", "quid": "1679", "cityname": "乐都县"}, {
    "pid": "27",
    "cid": "1020",
    "quid": "1680",
    "cityname": "互助"
}, {"pid": "27", "cid": "124", "quid": "1681", "cityname": "大通"}, {
    "pid": "27",
    "cid": "1651",
    "quid": "3034",
    "cityname": "昂欠县"
}, {"pid": "27", "cid": "1651", "quid": "3837", "cityname": "可可西里"}, {
    "pid": "27",
    "cid": "371",
    "quid": "3883",
    "cityname": "刚察县"
}, {"pid": "27", "cid": "124", "quid": "9882", "cityname": "城中区"}, {
    "pid": "27",
    "cid": "124",
    "quid": "9883",
    "cityname": "城东区"
}, {"pid": "27", "cid": "124", "quid": "9884", "cityname": "城西区"}, {
    "pid": "27",
    "cid": "124",
    "quid": "9885",
    "cityname": "城北区"
}, {"pid": "27", "cid": "22556", "quid": "22557", "cityname": "祁连县"}, {
    "pid": "28",
    "cid": "142",
    "quid": "1083",
    "cityname": "满洲里市"
}, {"pid": "28", "cid": "141", "quid": "1109", "cityname": "图里河"}, {
    "pid": "28",
    "cid": "2706",
    "quid": "1132",
    "cityname": "集宁"
}, {"pid": "28", "cid": "142", "quid": "1135", "cityname": "扎兰屯市"}, {
    "pid": "28",
    "cid": "142",
    "quid": "1136",
    "cityname": "牙克石市"
}, {"pid": "28", "cid": "500", "quid": "1153", "cityname": "博克图"}, {
    "pid": "28",
    "cid": "500",
    "quid": "1313",
    "cityname": "二连浩特市"
}, {"pid": "28", "cid": "141", "quid": "1314", "cityname": "白云鄂博"}, {
    "pid": "28",
    "cid": "484",
    "quid": "1522",
    "cityname": "阿尔山市"
}, {"pid": "28", "cid": "484", "quid": "1523", "cityname": "突泉县"}, {
    "pid": "28",
    "cid": "202",
    "quid": "1529",
    "cityname": "克什克腾旗"
}, {"pid": "28", "cid": "500", "quid": "1604", "cityname": "多伦县"}, {
    "pid": "28",
    "cid": "142",
    "quid": "2705",
    "cityname": "鄂温克族自治旗"
}, {"pid": "28", "cid": "103", "quid": "2707", "cityname": "托克托县"}, {
    "pid": "28",
    "cid": "103",
    "quid": "2708",
    "cityname": "清水河县"
}, {"pid": "28", "cid": "103", "quid": "2709", "cityname": "武川县"}, {
    "pid": "28",
    "cid": "103",
    "quid": "2710",
    "cityname": "和林格尔县"
}, {"pid": "28", "cid": "103", "quid": "2711", "cityname": "土默特左旗"}, {
    "pid": "28",
    "cid": "141",
    "quid": "2712",
    "cityname": "固阳县"
}, {"pid": "28", "cid": "141", "quid": "2713", "cityname": "土默特右旗"}, {
    "pid": "28",
    "cid": "141",
    "quid": "2714",
    "cityname": "达尔罕茂明安联合旗"
}, {"pid": "28", "cid": "202", "quid": "2715", "cityname": "宁城县"}, {
    "pid": "28",
    "cid": "202",
    "quid": "2716",
    "cityname": "林西县"
}, {"pid": "28", "cid": "202", "quid": "2717", "cityname": "喀喇沁旗"}, {
    "pid": "28",
    "cid": "202",
    "quid": "2718",
    "cityname": "巴林左旗"
}, {"pid": "28", "cid": "202", "quid": "2719", "cityname": "敖汉旗"}, {
    "pid": "28",
    "cid": "202",
    "quid": "2720",
    "cityname": "阿鲁科尔沁旗"
}, {"pid": "28", "cid": "202", "quid": "2721", "cityname": "翁牛特旗"}, {
    "pid": "28",
    "cid": "202",
    "quid": "2722",
    "cityname": "巴林右旗"
}, {"pid": "28", "cid": "458", "quid": "2723", "cityname": "霍林郭勒市"}, {
    "pid": "28",
    "cid": "458",
    "quid": "2724",
    "cityname": "开鲁县"
}, {"pid": "28", "cid": "458", "quid": "2725", "cityname": "科尔沁左翼中旗"}, {
    "pid": "28",
    "cid": "458",
    "quid": "2726",
    "cityname": "科尔沁左翼后旗"
}, {"pid": "28", "cid": "458", "quid": "2727", "cityname": "库伦旗"}, {
    "pid": "28",
    "cid": "458",
    "quid": "2728",
    "cityname": "奈曼旗"
}, {"pid": "28", "cid": "458", "quid": "2729", "cityname": "扎鲁特旗"}, {
    "pid": "28",
    "cid": "1368",
    "quid": "2730",
    "cityname": "准格尔旗"
}, {"pid": "28", "cid": "1368", "quid": "2731", "cityname": "乌审旗"}, {
    "pid": "28",
    "cid": "1368",
    "quid": "2732",
    "cityname": "伊金霍洛旗"
}, {"pid": "28", "cid": "1368", "quid": "2733", "cityname": "鄂托克旗"}, {
    "pid": "28",
    "cid": "1368",
    "quid": "2734",
    "cityname": "鄂托克前旗"
}, {"pid": "28", "cid": "1368", "quid": "2735", "cityname": "杭锦旗"}, {
    "pid": "28",
    "cid": "1368",
    "quid": "2736",
    "cityname": "达拉特旗"
}, {"pid": "28", "cid": "142", "quid": "2737", "cityname": "根河市"}, {
    "pid": "28",
    "cid": "142",
    "quid": "2738",
    "cityname": "额尔古纳市"
}, {"pid": "28", "cid": "142", "quid": "2739", "cityname": "鄂伦春自治旗"}, {
    "pid": "28",
    "cid": "142",
    "quid": "2740",
    "cityname": "陈巴尔虎旗"
}, {"pid": "28", "cid": "142", "quid": "2741", "cityname": "阿荣旗"}, {
    "pid": "28",
    "cid": "2742",
    "quid": "2743",
    "cityname": "五原县"
}, {"pid": "28", "cid": "2742", "quid": "2744", "cityname": "磴口县"}, {
    "pid": "28",
    "cid": "2742",
    "quid": "2745",
    "cityname": "杭锦后旗"
}, {"pid": "28", "cid": "2742", "quid": "2746", "cityname": "乌拉特中旗"}, {
    "pid": "28",
    "cid": "2742",
    "quid": "2747",
    "cityname": "乌拉特前旗"
}, {"pid": "28", "cid": "2742", "quid": "2748", "cityname": "乌拉特后旗"}, {
    "pid": "28",
    "cid": "2706",
    "quid": "2749",
    "cityname": "丰镇市"
}, {"pid": "28", "cid": "2706", "quid": "2750", "cityname": "兴和县"}, {
    "pid": "28",
    "cid": "2706",
    "quid": "2751",
    "cityname": "卓资县"
}, {"pid": "28", "cid": "2706", "quid": "2752", "cityname": "商都县"}, {
    "pid": "28",
    "cid": "2706",
    "quid": "2753",
    "cityname": "凉城县"
}, {"pid": "28", "cid": "2706", "quid": "2754", "cityname": "化德县"}, {
    "pid": "28",
    "cid": "2706",
    "quid": "2755",
    "cityname": "四子王旗"
}, {"pid": "28", "cid": "2706", "quid": "2756", "cityname": "察哈尔右翼前旗"}, {
    "pid": "28",
    "cid": "2706",
    "quid": "2757",
    "cityname": "察哈尔右翼中旗"
}, {"pid": "28", "cid": "2706", "quid": "2758", "cityname": "察哈尔右翼后旗"}, {
    "pid": "28",
    "cid": "500",
    "quid": "2759",
    "cityname": "阿巴嘎旗"
}, {"pid": "28", "cid": "500", "quid": "2760", "cityname": "太仆寺旗"}, {
    "pid": "28",
    "cid": "500",
    "quid": "2761",
    "cityname": "正镶白旗"
}, {"pid": "28", "cid": "500", "quid": "2762", "cityname": "正蓝旗"}, {
    "pid": "28",
    "cid": "500",
    "quid": "2763",
    "cityname": "镶黄旗"
}, {"pid": "28", "cid": "500", "quid": "2764", "cityname": "东乌珠穆沁旗"}, {
    "pid": "28",
    "cid": "500",
    "quid": "2765",
    "cityname": "西乌珠穆沁旗"
}, {"pid": "28", "cid": "500", "quid": "2766", "cityname": "苏尼特左旗"}, {
    "pid": "28",
    "cid": "500",
    "quid": "2767",
    "cityname": "苏尼特右旗"
}, {"pid": "28", "cid": "2768", "quid": "2769", "cityname": "阿拉善左旗"}, {
    "pid": "28",
    "cid": "2768",
    "quid": "2770",
    "cityname": "阿拉善右旗"
}, {"pid": "28", "cid": "2768", "quid": "2771", "cityname": "额济纳旗"}, {
    "pid": "28",
    "cid": "484",
    "quid": "2772",
    "cityname": "扎赉特旗"
}, {"pid": "28", "cid": "484", "quid": "2773", "cityname": "科尔沁右翼前旗"}, {
    "pid": "28",
    "cid": "484",
    "quid": "2774",
    "cityname": "科尔沁右翼中旗"
}, {"pid": "28", "cid": "142", "quid": "2776", "cityname": "新巴尔虎右旗"}, {
    "pid": "28",
    "cid": "142",
    "quid": "2777",
    "cityname": "莫力达瓦达斡尔族自治旗"
}, {"pid": "28", "cid": "142", "quid": "2778", "cityname": "新巴尔虎左旗"}, {
    "pid": "28",
    "cid": "103",
    "quid": "10301",
    "cityname": "回民区"
}, {"pid": "28", "cid": "103", "quid": "10302", "cityname": "玉泉区"}, {
    "pid": "28",
    "cid": "103",
    "quid": "10303",
    "cityname": "新城区"
}, {"pid": "28", "cid": "103", "quid": "10304", "cityname": "赛罕区"}, {
    "pid": "28",
    "cid": "141",
    "quid": "10305",
    "cityname": "昆都仑区"
}, {"pid": "28", "cid": "141", "quid": "10306", "cityname": "青山区"}, {
    "pid": "28",
    "cid": "141",
    "quid": "10307",
    "cityname": "东河区"
}, {"pid": "28", "cid": "141", "quid": "10308", "cityname": "九原区"}, {
    "pid": "28",
    "cid": "141",
    "quid": "10309",
    "cityname": "石拐区"
}, {"pid": "28", "cid": "141", "quid": "10310", "cityname": "白云矿区"}, {
    "pid": "28",
    "cid": "1133",
    "quid": "10311",
    "cityname": "海勃湾区"
}, {"pid": "28", "cid": "1133", "quid": "10312", "cityname": "乌达区"}, {
    "pid": "28",
    "cid": "1133",
    "quid": "10313",
    "cityname": "海南区"
}, {"pid": "28", "cid": "202", "quid": "10314", "cityname": "红山区"}, {
    "pid": "28",
    "cid": "202",
    "quid": "10315",
    "cityname": "元宝山区"
}, {"pid": "28", "cid": "202", "quid": "10316", "cityname": "松山区"}, {
    "pid": "28",
    "cid": "458",
    "quid": "10317",
    "cityname": "科尔沁区"
}, {"pid": "28", "cid": "1368", "quid": "10318", "cityname": "东胜区"}, {
    "pid": "28",
    "cid": "2742",
    "quid": "10319",
    "cityname": "临河区"
}, {"pid": "28", "cid": "2706", "quid": "10320", "cityname": "集宁区"}, {
    "pid": "28",
    "cid": "22469",
    "quid": "22470",
    "cityname": "阿尔山市"
}, {"pid": "28", "cid": "141", "quid": "22525", "cityname": "稀土开发区"}, {
    "pid": "28",
    "cid": "142",
    "quid": "22558",
    "cityname": "市中心"
}, {"pid": "28", "cid": "22611", "quid": "22612", "cityname": "额济纳旗"}, {
    "pid": "29",
    "cid": "175",
    "quid": "255",
    "cityname": "富蕴县"
}, {"pid": "29", "cid": "173", "quid": "329", "cityname": "库车县"}, {
    "pid": "29",
    "cid": "330",
    "quid": "399",
    "cityname": "且末县"
}, {"pid": "29", "cid": "39", "quid": "426", "cityname": "石河子市"}, {
    "pid": "29",
    "cid": "109",
    "quid": "466",
    "cityname": "塔什库尔干"
}, {"pid": "29", "cid": "98", "quid": "529", "cityname": "伊宁"}, {
    "pid": "29",
    "cid": "40",
    "quid": "901",
    "cityname": "鄯善县"
}, {"pid": "29", "cid": "39", "quid": "1299", "cityname": "乌西"}, {
    "pid": "29",
    "cid": "98",
    "quid": "1325",
    "cityname": "奎屯市"
}, {"pid": "29", "cid": "2949", "quid": "1327", "cityname": "阿拉山口"}, {
    "pid": "29",
    "cid": "98",
    "quid": "1517",
    "cityname": "察布县"
}, {"pid": "29", "cid": "285", "quid": "1518", "cityname": "巴里"}, {
    "pid": "29",
    "cid": "175",
    "quid": "1569",
    "cityname": "布尔津县"
}, {"pid": "29", "cid": "175", "quid": "1577", "cityname": "哈巴河县"}, {
    "pid": "29",
    "cid": "40",
    "quid": "1606",
    "cityname": "托克逊县"
}, {"pid": "29", "cid": "330", "quid": "1607", "cityname": "若羌县"}, {
    "pid": "29",
    "cid": "109",
    "quid": "1608",
    "cityname": "巴楚县"
}, {"pid": "29", "cid": "173", "quid": "1609", "cityname": "温宿县"}, {
    "pid": "29",
    "cid": "98",
    "quid": "1610",
    "cityname": "昭苏县"
}, {"pid": "29", "cid": "2949", "quid": "1611", "cityname": "精河县"}, {
    "pid": "29",
    "cid": "175",
    "quid": "1612",
    "cityname": "福海县"
}, {"pid": "29", "cid": "109", "quid": "1639", "cityname": "叶城县"}, {
    "pid": "29",
    "cid": "294",
    "quid": "1682",
    "cityname": "民丰县"
}, {"pid": "29", "cid": "294", "quid": "1683", "cityname": "于田县"}, {
    "pid": "29",
    "cid": "294",
    "quid": "1684",
    "cityname": "策勒县"
}, {"pid": "29", "cid": "294", "quid": "1685", "cityname": "洛浦县"}, {
    "pid": "29",
    "cid": "294",
    "quid": "1686",
    "cityname": "墨玉县"
}, {"pid": "29", "cid": "294", "quid": "1687", "cityname": "皮山县"}, {
    "pid": "29",
    "cid": "109",
    "quid": "1688",
    "cityname": "伽师县"
}, {"pid": "29", "cid": "109", "quid": "1689", "cityname": "岳普湖县"}, {
    "pid": "29",
    "cid": "109",
    "quid": "1690",
    "cityname": "英吉沙县"
}, {"pid": "29", "cid": "109", "quid": "1691", "cityname": "莎车县"}, {
    "pid": "29",
    "cid": "109",
    "quid": "1692",
    "cityname": "泽普县"
}, {"pid": "29", "cid": "1694", "quid": "1693", "cityname": "乌恰县"}, {
    "pid": "29",
    "cid": "109",
    "quid": "1695",
    "cityname": "疏附县"
}, {"pid": "29", "cid": "109", "quid": "1696", "cityname": "疏勒县"}, {
    "pid": "29",
    "cid": "1694",
    "quid": "1697",
    "cityname": "阿克陶县"
}, {"pid": "29", "cid": "1694", "quid": "1698", "cityname": "阿合奇县"}, {
    "pid": "29",
    "cid": "285",
    "quid": "1699",
    "cityname": "伊吾县"
}, {"pid": "29", "cid": "1519", "quid": "1700", "cityname": "木垒"}, {
    "pid": "29",
    "cid": "1519",
    "quid": "1701",
    "cityname": "奇台县"
}, {"pid": "29", "cid": "1519", "quid": "1702", "cityname": "吉木萨尔县"}, {
    "pid": "29",
    "cid": "1519",
    "quid": "1703",
    "cityname": "阜康市"
}, {"pid": "29", "cid": "1519", "quid": "1704", "cityname": "米泉市"}, {
    "pid": "29",
    "cid": "330",
    "quid": "1705",
    "cityname": "和硕县"
}, {"pid": "29", "cid": "330", "quid": "1706", "cityname": "博湖县"}, {
    "pid": "29",
    "cid": "175",
    "quid": "2950",
    "cityname": "青河县"
}, {"pid": "29", "cid": "175", "quid": "2951", "cityname": "吉木乃县"}, {
    "pid": "29",
    "cid": "455",
    "quid": "2952",
    "cityname": "乌苏市"
}, {"pid": "29", "cid": "455", "quid": "2953", "cityname": "额敏县"}, {
    "pid": "29",
    "cid": "455",
    "quid": "2954",
    "cityname": "裕民县"
}, {"pid": "29", "cid": "455", "quid": "2955", "cityname": "沙湾县"}, {
    "pid": "29",
    "cid": "455",
    "quid": "2956",
    "cityname": "托里县"
}, {"pid": "29", "cid": "455", "quid": "2957", "cityname": "和布克赛尔蒙古自治县"}, {
    "pid": "29",
    "cid": "98",
    "quid": "2958",
    "cityname": "特克斯县"
}, {"pid": "29", "cid": "98", "quid": "2959", "cityname": "尼勒克县"}, {
    "pid": "29",
    "cid": "98",
    "quid": "2960",
    "cityname": "新源县"
}, {"pid": "29", "cid": "98", "quid": "2961", "cityname": "霍城县"}, {
    "pid": "29",
    "cid": "98",
    "quid": "2962",
    "cityname": "巩留县"
}, {"pid": "29", "cid": "2949", "quid": "2963", "cityname": "温泉县"}, {
    "pid": "29",
    "cid": "1519",
    "quid": "2964",
    "cityname": "呼图壁县"
}, {"pid": "29", "cid": "330", "quid": "2965", "cityname": "尉犁县"}, {
    "pid": "29",
    "cid": "330",
    "quid": "2966",
    "cityname": "和静县"
}, {"pid": "29", "cid": "330", "quid": "2967", "cityname": "轮台县"}, {
    "pid": "29",
    "cid": "330",
    "quid": "2968",
    "cityname": "焉耆回族自治县"
}, {"pid": "29", "cid": "39", "quid": "2969", "cityname": "五家渠市"}, {
    "pid": "29",
    "cid": "39",
    "quid": "2970",
    "cityname": "阿拉尔市"
}, {"pid": "29", "cid": "39", "quid": "2971", "cityname": "图木舒克市"}, {
    "pid": "29",
    "cid": "39",
    "quid": "2972",
    "cityname": "乌鲁木齐县"
}, {"pid": "29", "cid": "109", "quid": "3008", "cityname": "麦盖提县"}, {
    "pid": "29",
    "cid": "173",
    "quid": "3009",
    "cityname": "沙雅县"
}, {"pid": "29", "cid": "173", "quid": "3010", "cityname": "新和县"}, {
    "pid": "29",
    "cid": "173",
    "quid": "3011",
    "cityname": "拜城县"
}, {"pid": "29", "cid": "173", "quid": "3012", "cityname": "乌什县"}, {
    "pid": "29",
    "cid": "173",
    "quid": "3013",
    "cityname": "阿瓦提县"
}, {"pid": "29", "cid": "173", "quid": "3014", "cityname": "柯坪县"}, {
    "pid": "29",
    "cid": "294",
    "quid": "3015",
    "cityname": "和田县"
}, {"pid": "29", "cid": "1519", "quid": "3016", "cityname": "玛纳斯县"}, {
    "pid": "29",
    "cid": "166",
    "quid": "3226",
    "cityname": "乌尔禾区"
}, {"pid": "29", "cid": "166", "quid": "3227", "cityname": "独山子区"}, {
    "pid": "29",
    "cid": "166",
    "quid": "3228",
    "cityname": "白碱滩区"
}, {"pid": "29", "cid": "39", "quid": "3229", "cityname": "达坂城"}, {
    "pid": "29",
    "cid": "109",
    "quid": "3239",
    "cityname": "大红柳滩"
}, {"pid": "29", "cid": "39", "quid": "3248", "cityname": "罗布泊"}, {
    "pid": "29",
    "cid": "39",
    "quid": "9852",
    "cityname": "天山区"
}, {"pid": "29", "cid": "39", "quid": "9853", "cityname": "沙依巴克区"}, {
    "pid": "29",
    "cid": "39",
    "quid": "9854",
    "cityname": "新市区"
}, {"pid": "29", "cid": "39", "quid": "9855", "cityname": "水磨沟区"}, {
    "pid": "29",
    "cid": "39",
    "quid": "9856",
    "cityname": "头屯河区"
}, {"pid": "29", "cid": "39", "quid": "9857", "cityname": "东山区"}, {
    "pid": "29",
    "cid": "166",
    "quid": "9858",
    "cityname": "克拉玛依区"
}, {"pid": "29", "cid": "175", "quid": "10827", "cityname": "拉斯特乡"}, {
    "pid": "29",
    "cid": "175",
    "quid": "10828",
    "cityname": "汗德孕特"
}, {"pid": "29", "cid": "175", "quid": "10829", "cityname": "阿苇滩镇"}, {
    "pid": "29",
    "cid": "175",
    "quid": "10830",
    "cityname": "切木尔切克"
}, {"pid": "29", "cid": "175", "quid": "10831", "cityname": "阿拉哈克乡"}, {
    "pid": "29",
    "cid": "175",
    "quid": "10832",
    "cityname": "北屯镇"
}, {"pid": "29", "cid": "175", "quid": "10833", "cityname": "巴里巴盖乡"}, {
    "pid": "29",
    "cid": "175",
    "quid": "10834",
    "cityname": "红墩镇"
}, {"pid": "29", "cid": "330", "quid": "11972", "cityname": "萨依巴格办事处"}, {
    "pid": "29",
    "cid": "330",
    "quid": "11973",
    "cityname": "团结办事处"
}, {"pid": "29", "cid": "330", "quid": "11974", "cityname": "新城办事处"}, {
    "pid": "29",
    "cid": "330",
    "quid": "11975",
    "cityname": "天山办事处"
}, {"pid": "29", "cid": "330", "quid": "11976", "cityname": "建设路办事处"}, {
    "pid": "29",
    "cid": "330",
    "quid": "11977",
    "cityname": "塔什店镇"
}, {"pid": "29", "cid": "330", "quid": "11978", "cityname": "上户镇"}, {
    "pid": "29",
    "cid": "330",
    "quid": "11979",
    "cityname": "英下乡"
}, {"pid": "29", "cid": "330", "quid": "11980", "cityname": "铁克其乡"}, {
    "pid": "29",
    "cid": "330",
    "quid": "11981",
    "cityname": "恰尔巴克乡"
}, {"pid": "29", "cid": "330", "quid": "11982", "cityname": "兰干乡"}, {
    "pid": "29",
    "cid": "330",
    "quid": "11983",
    "cityname": "哈拉玉宫乡"
}, {"pid": "29", "cid": "330", "quid": "11984", "cityname": "阿瓦提乡"}, {
    "pid": "29",
    "cid": "330",
    "quid": "11985",
    "cityname": "和什力克乡"
}, {"pid": "29", "cid": "330", "quid": "11986", "cityname": "托布力其乡"}, {
    "pid": "29",
    "cid": "330",
    "quid": "11987",
    "cityname": "普惠乡塔什店镇"
}, {"pid": "29", "cid": "39", "quid": "22526", "cityname": "开发区"}, {
    "pid": "30",
    "cid": "575",
    "quid": "1469",
    "cityname": "丁青县"
}, {"pid": "30", "cid": "92", "quid": "1471", "cityname": "江孜县"}, {
    "pid": "30",
    "cid": "92",
    "quid": "1472",
    "cityname": "樟木镇"
}, {"pid": "30", "cid": "97", "quid": "1707", "cityname": "日土县"}, {
    "pid": "30",
    "cid": "97",
    "quid": "1708",
    "cityname": "革吉县"
}, {"pid": "30", "cid": "97", "quid": "1709", "cityname": "普兰县"}, {
    "pid": "30",
    "cid": "97",
    "quid": "1710",
    "cityname": "扎达县"
}, {"pid": "30", "cid": "97", "quid": "1711", "cityname": "改则县"}, {
    "pid": "30",
    "cid": "97",
    "quid": "1712",
    "cityname": "措勤县"
}, {"pid": "30", "cid": "92", "quid": "1713", "cityname": "仲巴县"}, {
    "pid": "30",
    "cid": "92",
    "quid": "1714",
    "cityname": "萨嘎县"
}, {"pid": "30", "cid": "92", "quid": "1715", "cityname": "吉隆县"}, {
    "pid": "30",
    "cid": "1470",
    "quid": "1716",
    "cityname": "尼玛县"
}, {"pid": "30", "cid": "1470", "quid": "1717", "cityname": "申扎县"}, {
    "pid": "30",
    "cid": "92",
    "quid": "1718",
    "cityname": "昂仁县"
}, {"pid": "30", "cid": "92", "quid": "1719", "cityname": "定日县"}, {
    "pid": "30",
    "cid": "92",
    "quid": "1720",
    "cityname": "聂拉木县"
}, {"pid": "30", "cid": "92", "quid": "1721", "cityname": "定结县"}, {
    "pid": "30",
    "cid": "92",
    "quid": "1722",
    "cityname": "萨迦县"
}, {"pid": "30", "cid": "92", "quid": "1723", "cityname": "拉孜县"}, {
    "pid": "30",
    "cid": "92",
    "quid": "1724",
    "cityname": "谢通门县"
}, {"pid": "30", "cid": "92", "quid": "1725", "cityname": "南木林县"}, {
    "pid": "30",
    "cid": "92",
    "quid": "1726",
    "cityname": "白朗县"
}, {"pid": "30", "cid": "92", "quid": "1727", "cityname": "岗巴县"}, {
    "pid": "30",
    "cid": "92",
    "quid": "1728",
    "cityname": "亚东县"
}, {"pid": "30", "cid": "92", "quid": "1729", "cityname": "康马县"}, {
    "pid": "30",
    "cid": "41",
    "quid": "1730",
    "cityname": "尼木县"
}, {"pid": "30", "cid": "92", "quid": "1731", "cityname": "仁布县"}, {
    "pid": "30",
    "cid": "41",
    "quid": "1732",
    "cityname": "堆龙德庆县"
}, {"pid": "30", "cid": "41", "quid": "1733", "cityname": "曲水县"}, {
    "pid": "30",
    "cid": "439",
    "quid": "1734",
    "cityname": "贡嘎县"
}, {"pid": "30", "cid": "439", "quid": "1735", "cityname": "扎蘘县"}, {
    "pid": "30",
    "cid": "439",
    "quid": "1736",
    "cityname": "浪卡子县"
}, {"pid": "30", "cid": "439", "quid": "1737", "cityname": "洛扎县"}, {
    "pid": "30",
    "cid": "439",
    "quid": "1738",
    "cityname": "措美县"
}, {"pid": "30", "cid": "439", "quid": "1739", "cityname": "琼结县"}, {
    "pid": "30",
    "cid": "439",
    "quid": "1740",
    "cityname": "乃东县"
}, {"pid": "30", "cid": "41", "quid": "1741", "cityname": "墨竹工卡县"}, {
    "pid": "30",
    "cid": "41",
    "quid": "1742",
    "cityname": "林周县"
}, {"pid": "30", "cid": "439", "quid": "1743", "cityname": "桑日县"}, {
    "pid": "30",
    "cid": "41",
    "quid": "1744",
    "cityname": "当雄县"
}, {"pid": "30", "cid": "1470", "quid": "1745", "cityname": "安多县"}, {
    "pid": "30",
    "cid": "1470",
    "quid": "1746",
    "cityname": "聂荣县"
}, {"pid": "30", "cid": "1470", "quid": "1747", "cityname": "比如县"}, {
    "pid": "30",
    "cid": "1470",
    "quid": "1748",
    "cityname": "嘉黎县"
}, {"pid": "30", "cid": "108", "quid": "1749", "cityname": "工布江达县"}, {
    "pid": "30",
    "cid": "108",
    "quid": "1750",
    "cityname": "朗县"
}, {"pid": "30", "cid": "439", "quid": "1751", "cityname": "加查县"}, {
    "pid": "30",
    "cid": "439",
    "quid": "1752",
    "cityname": "曲松县"
}, {"pid": "30", "cid": "439", "quid": "1753", "cityname": "隆子县"}, {
    "pid": "30",
    "cid": "439",
    "quid": "1754",
    "cityname": "错那县"
}, {"pid": "30", "cid": "108", "quid": "1755", "cityname": "米林县"}, {
    "pid": "30",
    "cid": "108",
    "quid": "1756",
    "cityname": "墨脱县"
}, {"pid": "30", "cid": "575", "quid": "1757", "cityname": "边坝县"}, {
    "pid": "30",
    "cid": "575",
    "quid": "1758",
    "cityname": "洛隆县"
}, {"pid": "30", "cid": "575", "quid": "1759", "cityname": "类乌齐县"}, {
    "pid": "30",
    "cid": "575",
    "quid": "1760",
    "cityname": "江达县"
}, {"pid": "30", "cid": "575", "quid": "1761", "cityname": "贡觉县"}, {
    "pid": "30",
    "cid": "575",
    "quid": "1762",
    "cityname": "芒康县"
}, {"pid": "30", "cid": "575", "quid": "1763", "cityname": "左贡县"}, {
    "pid": "30",
    "cid": "575",
    "quid": "1764",
    "cityname": "八宿县"
}, {"pid": "30", "cid": "108", "quid": "1765", "cityname": "察隅县"}, {
    "pid": "30",
    "cid": "108",
    "quid": "1766",
    "cityname": "波密县"
}, {"pid": "30", "cid": "575", "quid": "1767", "cityname": "察雅县"}, {
    "pid": "30",
    "cid": "575",
    "quid": "3233",
    "cityname": "邦达"
}, {"pid": "30", "cid": "108", "quid": "3235", "cityname": "通麦天险"}, {
    "pid": "30",
    "cid": "97",
    "quid": "3236",
    "cityname": "玛旁雍措"
}, {"pid": "30", "cid": "1470", "quid": "3242", "cityname": "巴青"}, {
    "pid": "30",
    "cid": "1470",
    "quid": "3243",
    "cityname": "索县"
}, {"pid": "30", "cid": "41", "quid": "3244", "cityname": "羊八井"}, {
    "pid": "30",
    "cid": "1470",
    "quid": "3252",
    "cityname": "班嘎县"
}, {"pid": "30", "cid": "1470", "quid": "3253", "cityname": "双湖特别行政区"}, {
    "pid": "30",
    "cid": "41",
    "quid": "3255",
    "cityname": "达孜县"
}, {"pid": "30", "cid": "41", "quid": "3840", "cityname": "羌塘"}, {
    "pid": "30",
    "cid": "41",
    "quid": "9915",
    "cityname": "城关区"
}, {"pid": "30", "cid": "108", "quid": "10907", "cityname": "林芝镇"}, {
    "pid": "30",
    "cid": "108",
    "quid": "10908",
    "cityname": "排龙门巴乡"
}, {"pid": "30", "cid": "108", "quid": "10909", "cityname": "色齐拉"}, {
    "pid": "30",
    "cid": "108",
    "quid": "10910",
    "cityname": "米瑞"
}, {"pid": "30", "cid": "108", "quid": "10911", "cityname": "布久"}, {
    "pid": "30",
    "cid": "108",
    "quid": "10912",
    "cityname": "百巴镇"
}, {"pid": "30", "cid": "97", "quid": "10913", "cityname": "狮泉河镇"}, {
    "pid": "30",
    "cid": "97",
    "quid": "10914",
    "cityname": "扎西岗"
}, {"pid": "30", "cid": "97", "quid": "10915", "cityname": "左左"}, {
    "pid": "30",
    "cid": "97",
    "quid": "10916",
    "cityname": "昆沙"
}, {"pid": "30", "cid": "97", "quid": "10917", "cityname": "门士"}, {
    "pid": "30",
    "cid": "1470",
    "quid": "11141",
    "cityname": "★那曲镇"
}, {"pid": "30", "cid": "1470", "quid": "11142", "cityname": "谷露"}, {
    "pid": "30",
    "cid": "1470",
    "quid": "11143",
    "cityname": "色雄"
}, {"pid": "30", "cid": "575", "quid": "11514", "cityname": "★昌都镇"}, {
    "pid": "30",
    "cid": "575",
    "quid": "11515",
    "cityname": "嘎马"
}, {"pid": "30", "cid": "575", "quid": "11516", "cityname": "约巴"}, {
    "pid": "30",
    "cid": "575",
    "quid": "11517",
    "cityname": "柴维"
}, {"pid": "30", "cid": "575", "quid": "11518", "cityname": "拉多"}, {
    "pid": "30",
    "cid": "575",
    "quid": "11519",
    "cityname": "芒达"
}, {"pid": "30", "cid": "575", "quid": "11520", "cityname": "日通"}, {
    "pid": "30",
    "cid": "575",
    "quid": "11521",
    "cityname": "如意"
}, {"pid": "30", "cid": "575", "quid": "11522", "cityname": "妥坝"}, {
    "pid": "30",
    "cid": "575",
    "quid": "11523",
    "cityname": "俄洛镇"
}, {"pid": "30", "cid": "575", "quid": "11524", "cityname": "卡诺镇"}, {
    "pid": "30",
    "cid": "575",
    "quid": "11525",
    "cityname": "埃西"
}, {"pid": "30", "cid": "575", "quid": "11526", "cityname": "若巴"}, {
    "pid": "30",
    "cid": "108",
    "quid": "22606",
    "cityname": "八一镇"
}, {"pid": "31", "cid": "2321", "quid": "44", "cityname": "文昌市"}, {
    "pid": "31",
    "cid": "2321",
    "quid": "45",
    "cityname": "万宁市"
}, {"pid": "31", "cid": "2321", "quid": "46", "cityname": "五指山市"}, {
    "pid": "31",
    "cid": "2321",
    "quid": "47",
    "cityname": "屯昌县"
}, {"pid": "31", "cid": "2321", "quid": "48", "cityname": "东方市"}, {
    "pid": "31",
    "cid": "2321",
    "quid": "49",
    "cityname": "乐东"
}, {"pid": "31", "cid": "2321", "quid": "50", "cityname": "定安县"}, {
    "pid": "31",
    "cid": "2321",
    "quid": "52",
    "cityname": "琼海市"
}, {"pid": "31", "cid": "2321", "quid": "53", "cityname": "琼中"}, {
    "pid": "31",
    "cid": "2321",
    "quid": "54",
    "cityname": "保亭"
}, {"pid": "31", "cid": "2321", "quid": "55", "cityname": "陵水"}, {
    "pid": "31",
    "cid": "2321",
    "quid": "56",
    "cityname": "昌江"
}, {"pid": "31", "cid": "2321", "quid": "57", "cityname": "儋州市"}, {
    "pid": "31",
    "cid": "2321",
    "quid": "1787",
    "cityname": "白沙"
}, {"pid": "31", "cid": "2321", "quid": "1790", "cityname": "澄迈县"}, {
    "pid": "31",
    "cid": "2321",
    "quid": "1791",
    "cityname": "临高县"
}, {"pid": "31", "cid": "2321", "quid": "3004", "cityname": "中沙群岛"}, {
    "pid": "31",
    "cid": "2321",
    "quid": "3005",
    "cityname": "西沙群岛"
}, {"pid": "31", "cid": "2321", "quid": "3006", "cityname": "南沙群岛"}, {
    "pid": "31",
    "cid": "2321",
    "quid": "3029",
    "cityname": "永暑礁"
}, {"pid": "31", "cid": "2321", "quid": "3030", "cityname": "永兴岛"}, {
    "pid": "31",
    "cid": "42",
    "quid": "10076",
    "cityname": "龙华区"
}, {"pid": "31", "cid": "42", "quid": "10077", "cityname": "秀英区"}, {
    "pid": "31",
    "cid": "42",
    "quid": "10078",
    "cityname": "琼山区"
}, {"pid": "31", "cid": "42", "quid": "10079", "cityname": "美兰区"}, {
    "pid": "31",
    "cid": "43",
    "quid": "10788",
    "cityname": "崖城镇"
}, {"pid": "31", "cid": "43", "quid": "10789", "cityname": "保港镇"}, {
    "pid": "31",
    "cid": "43",
    "quid": "10790",
    "cityname": "天涯镇"
}, {"pid": "31", "cid": "43", "quid": "10791", "cityname": "羊栏镇"}, {
    "pid": "31",
    "cid": "43",
    "quid": "10792",
    "cityname": "荔枝沟镇"
}, {"pid": "31", "cid": "43", "quid": "10793", "cityname": "红沙镇"}, {
    "pid": "31",
    "cid": "43",
    "quid": "10794",
    "cityname": "田独镇"
}, {"pid": "31", "cid": "43", "quid": "10795", "cityname": "林旺镇"}, {
    "pid": "31",
    "cid": "43",
    "quid": "10796",
    "cityname": "藤桥镇"
}, {"pid": "31", "cid": "43", "quid": "10797", "cityname": "高峰"}, {
    "pid": "31",
    "cid": "43",
    "quid": "10798",
    "cityname": "育才"
}, {"pid": "31", "cid": "43", "quid": "10799", "cityname": "雅亮"}, {
    "pid": "31",
    "cid": "42",
    "quid": "11064",
    "cityname": "灵山镇"
}, {"pid": "31", "cid": "42", "quid": "11065", "cityname": "三门坡镇"}, {
    "pid": "31",
    "cid": "43",
    "quid": "22516",
    "cityname": "鹿回头"
}, {"pid": "31", "cid": "43", "quid": "22519", "cityname": "河西区"}, {
    "pid": "31",
    "cid": "43",
    "quid": "22548",
    "cityname": "大东海度假区"
}, {"pid": "31", "cid": "43", "quid": "22549", "cityname": "海棠湾度假区"}, {
    "pid": "31",
    "cid": "43",
    "quid": "22550",
    "cityname": "市区"
}, {"pid": "31", "cid": "43", "quid": "22551", "cityname": "亚龙湾度假区"}, {
    "pid": "31",
    "cid": "22562",
    "quid": "22604",
    "cityname": "温泉旅游度假区"
}, {"pid": "32", "cid": "18", "quid": "58", "cityname": "港岛"}, {
    "pid": "32",
    "cid": "18",
    "quid": "314",
    "cityname": "九龙城区"
}, {"pid": "32", "cid": "18", "quid": "9865", "cityname": "中西区"}, {
    "pid": "32",
    "cid": "18",
    "quid": "9866",
    "cityname": "东区"
}, {"pid": "32", "cid": "18", "quid": "9868", "cityname": "南区"}, {
    "pid": "32",
    "cid": "18",
    "quid": "9870",
    "cityname": "黄大仙区"
}, {"pid": "32", "cid": "18", "quid": "9871", "cityname": "湾仔区"}, {
    "pid": "32",
    "cid": "18",
    "quid": "9874",
    "cityname": "葵青区"
}, {"pid": "32", "cid": "18", "quid": "9875", "cityname": "北区"}, {
    "pid": "32",
    "cid": "18",
    "quid": "22465",
    "cityname": "新界东"
}, {"pid": "32", "cid": "18", "quid": "22528", "cityname": "元朗区"}, {
    "pid": "32",
    "cid": "18",
    "quid": "22538",
    "cityname": "油尖旺区"
}, {"pid": "32", "cid": "18", "quid": "22539", "cityname": "深水埗区"}, {
    "pid": "32",
    "cid": "18",
    "quid": "22540",
    "cityname": "观塘区"
}, {"pid": "32", "cid": "18", "quid": "22541", "cityname": "大埔区"}, {
    "pid": "32",
    "cid": "18",
    "quid": "22542",
    "cityname": "沙田区"
}, {"pid": "32", "cid": "18", "quid": "22543", "cityname": "西贡区"}, {
    "pid": "32",
    "cid": "18",
    "quid": "22544",
    "cityname": "荃湾区"
}, {"pid": "32", "cid": "18", "quid": "22545", "cityname": "屯门区"}, {
    "pid": "32",
    "cid": "18",
    "quid": "22546",
    "cityname": "离岛区"
}, {"pid": "53", "cid": "617", "quid": "720", "cityname": "高雄"}, {
    "pid": "53",
    "cid": "617",
    "quid": "1613",
    "cityname": "台南"
}, {"pid": "53", "cid": "617", "quid": "1815", "cityname": "嘉义市"}, {
    "pid": "53",
    "cid": "617",
    "quid": "1816",
    "cityname": "基隆市"
}, {"pid": "53", "cid": "617", "quid": "1817", "cityname": "台中市"}, {
    "pid": "53",
    "cid": "617",
    "quid": "1818",
    "cityname": "新竹市"
}, {"pid": "53", "cid": "617", "quid": "1819", "cityname": "台北县"}, {
    "pid": "53",
    "cid": "617",
    "quid": "1820",
    "cityname": "宜兰县"
}, {"pid": "53", "cid": "617", "quid": "1821", "cityname": "桃园县"}, {
    "pid": "53",
    "cid": "617",
    "quid": "1822",
    "cityname": "苗栗县"
}, {"pid": "53", "cid": "617", "quid": "1823", "cityname": "台中县"}, {
    "pid": "53",
    "cid": "617",
    "quid": "1824",
    "cityname": "彰化县"
}, {"pid": "53", "cid": "617", "quid": "1825", "cityname": "南投县"}, {
    "pid": "53",
    "cid": "617",
    "quid": "1826",
    "cityname": "云林县"
}, {"pid": "53", "cid": "617", "quid": "1827", "cityname": "屏东县"}, {
    "pid": "53",
    "cid": "617",
    "quid": "1828",
    "cityname": "台东县"
}, {"pid": "53", "cid": "617", "quid": "1829", "cityname": "花莲县"}, {
    "pid": "53",
    "cid": "617",
    "quid": "1830",
    "cityname": "澎湖县"
}, {"pid": "53", "cid": "617", "quid": "3032", "cityname": "钓鱼岛群岛"}, {
    "pid": "53",
    "cid": "617",
    "quid": "3033",
    "cityname": "马祖列岛"
}, {"pid": "53", "cid": "617", "quid": "3596", "cityname": "兰屿"}, {
    "pid": "53",
    "cid": "617",
    "quid": "3597",
    "cityname": "绿岛"
}, {"pid": "53", "cid": "617", "quid": "10734", "cityname": "中正区"}, {
    "pid": "53",
    "cid": "617",
    "quid": "10735",
    "cityname": "大同区"
}, {"pid": "53", "cid": "617", "quid": "10736", "cityname": "中山区"}, {
    "pid": "53",
    "cid": "617",
    "quid": "10737",
    "cityname": "松山区"
}, {"pid": "53", "cid": "617", "quid": "10738", "cityname": "大安区"}, {
    "pid": "53",
    "cid": "617",
    "quid": "10739",
    "cityname": "万华区"
}, {"pid": "53", "cid": "617", "quid": "10740", "cityname": "信义区"}, {
    "pid": "53",
    "cid": "617",
    "quid": "10741",
    "cityname": "士林区"
}, {"pid": "53", "cid": "617", "quid": "10742", "cityname": "北投区"}, {
    "pid": "53",
    "cid": "617",
    "quid": "10743",
    "cityname": "内湖区"
}, {"pid": "53", "cid": "617", "quid": "10744", "cityname": "南港区"}, {
    "pid": "53",
    "cid": "617",
    "quid": "10745",
    "cityname": "文山区"
}, {"pid": "54", "cid": "3884", "quid": "3885", "cityname": "渤海"}, {
    "pid": "54",
    "cid": "3884",
    "quid": "3886",
    "cityname": "黄海"
}, {"pid": "54", "cid": "3884", "quid": "3887", "cityname": "东海"}, {
    "pid": "54",
    "cid": "3884",
    "quid": "3888",
    "cityname": "南海"
}, {"pid": "54", "cid": "3889", "quid": "3890", "cityname": "渤海海峡"}, {
    "pid": "54",
    "cid": "3889",
    "quid": "3891",
    "cityname": "琼州海峡"
}, {"pid": "54", "cid": "3892", "quid": "3893", "cityname": "辽东湾"}, {
    "pid": "54",
    "cid": "3892",
    "quid": "3894",
    "cityname": "渤海湾"
}, {"pid": "54", "cid": "3892", "quid": "3895", "cityname": "莱州湾"}, {
    "pid": "54",
    "cid": "3892",
    "quid": "3896",
    "cityname": "长江口"
}, {"pid": "54", "cid": "3892", "quid": "3897", "cityname": "杭州湾"}, {
    "pid": "54",
    "cid": "3892",
    "quid": "3898",
    "cityname": "伶仃洋"
}, {"pid": "54", "cid": "3892", "quid": "3899", "cityname": "北部湾"}, {
    "pid": "54",
    "cid": "3892",
    "quid": "3900",
    "cityname": "胶州湾"
}, {"pid": "54", "cid": "3892", "quid": "3901", "cityname": "海州湾"}, {
    "pid": "54",
    "cid": "3892",
    "quid": "3902",
    "cityname": "象山湾"
}, {"pid": "54", "cid": "3892", "quid": "3903", "cityname": "兴化湾"}, {
    "pid": "54",
    "cid": "3892",
    "quid": "3904",
    "cityname": "湄州湾"
}, {"pid": "54", "cid": "3892", "quid": "3905", "cityname": "大亚湾"}, {
    "pid": "54",
    "cid": "3892",
    "quid": "3906",
    "cityname": "三门湾"
}];
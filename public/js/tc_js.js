//弹出层
function openLayer(objId, conId) {
    var arrayPageSize = getPageSize();//调用getPageSize()函数
    var arrayPageScroll = getPageScroll();//调用getPageScroll()函数
    if (!document.getElementById("popupAddr")) {

//创建弹出内容层
        var popupDiv = document.createElement("div");
//给这个元素设置属性与样式
        popupDiv.setAttribute("id", "popupAddr")
        popupDiv.style.zIndex = 99;

//创建弹出背景层
        var bodyBack = document.createElement("div");
        bodyBack.setAttribute("id", "bodybg")
        bodyBack.style.zIndex = 98;

//实现弹出(插入到目标元素之后)
        var mybody = document.getElementById(objId);
        insertAfter(popupDiv, mybody);//执行函数insertAfter()
        insertAfter(bodyBack, mybody);//执行函数insertAfter()

    }

//显示背景层
    document.getElementById("bodybg").style.display = "";
//显示内容层
    var popObj = document.getElementById("popupAddr")
    popObj.innerHTML = document.getElementById(conId).innerHTML;
    popObj.style.display = "";
//让弹出层在页面中垂直左右居中(统一)
//popObj.style.width = "600px";
//popObj.style.height = "400px";
//popObj.style.top = arrayPageScroll[1] + (arrayPageSize[3] - 35 - 400) / 2 + 'px';
//popObj.style.left = (arrayPageSize[0] - 20 - 600) / 2 + 'px';
//让弹出层在页面中垂直左右居中(个性)
    var arrayConSize = getConSize(conId)
    popObj.style.top = arrayPageScroll[1] + (arrayPageSize[3] - arrayConSize[1]) / 2 - 50 + 'px';
    popObj.style.left = (arrayPageSize[0] - arrayConSize[0]) / 2 - 30 + 'px';
}
//获取内容层内容原始尺寸
function getConSize(conId) {
    var conObj = document.getElementById(conId)
    conObj.style.position = "absolute";
    conObj.style.left = -1000 + "px";
    conObj.style.display = "";
    var arrayConSize = [conObj.offsetWidth, conObj.offsetHeight]
    conObj.style.display = "none";
    return arrayConSize;
}
function insertAfter(newElement, targetElement) {//插入
    var parent = targetElement.parentNode;
    if (parent.lastChild == targetElement) {
        parent.appendChild(newElement);
    }
    else {
        parent.insertBefore(newElement, targetElement.nextSibling);
    }
}
//获取滚动条的高度
function getPageScroll() {
    var yScroll;
    if (self.pageYOffset) {
        yScroll = self.pageYOffset;
    } else if (document.documentElement && document.documentElement.scrollTop) {
        yScroll = document.documentElement.scrollTop;
    } else if (document.body) {
        yScroll = document.body.scrollTop;
    }

    arrayPageScroll = new Array('', yScroll)
    return arrayPageScroll;
}
//获取页面实际大小
function getPageSize() {
    var xScroll, yScroll;

    if (window.innerHeight && window.scrollMaxY) {
        xScroll = document.body.scrollWidth;
        yScroll = window.innerHeight + window.scrollMaxY;
    } else if (document.body.scrollHeight > document.body.offsetHeight) {
        sScroll = document.body.scrollWidth;
        yScroll = document.body.scrollHeight;
    } else {
        xScroll = document.body.offsetWidth;
        yScroll = document.body.offsetHeight;
    }

    var windowWidth, windowHeight;
//var pageHeight,pageWidth;
    if (self.innerHeight) {
        windowWidth = self.innerWidth;
        windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) {
        windowWidth = document.documentElement.clientWidth;
        windowHeight = document.documentElement.clientHeight;
    } else if (document.body) {
        windowWidth = document.body.clientWidth;
        windowHeight = document.body.clientHeight;
    }

    var pageWidth, pageHeight
    if (yScroll < windowHeight) {
        pageHeight = windowHeight;
    } else {
        pageHeight = yScroll;
    }
    if (xScroll < windowWidth) {
        pageWidth = windowWidth;
    } else {
        pageWidth = xScroll;
    }
    arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight)
    return arrayPageSize;
}
//关闭弹出层
function closeLayer() {
    document.getElementById("popupAddr").style.display = "none";
    document.getElementById("bodybg").style.display = "none";
    return false;
}
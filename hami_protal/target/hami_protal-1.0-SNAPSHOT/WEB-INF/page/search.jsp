<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@include file="header.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="data-spm" content="a1z1s"/>
    <meta name="verify-v1" content="gNntuhTm2rH7Qa/GPp6lf0mIp9KQsjejNs+i1LZhG7U="/>
    <meta name="baidu-site-verification" content="xaLcM8mGHG"/>
    <title>虾米音乐</title>
    <meta name="apple-itunes-app" content="app-id=595594905">
    <meta name="applicable-device" content="pc">

    <link rel="shortcut icon" href="../../favicon.ico"/>

    <link rel="stylesheet" type="text/css" href="../../css/portal/reset.css">
    <link rel="stylesheet" type="text/css" href="../../css/portal/base.css">
    <link rel="stylesheet" type="text/css" href="../../css/portal/old.css">
    <link rel="stylesheet" type="text/css" href="../../css/portal/header.css">
    <link rel="stylesheet" type="text/css" href="../../css/portal/name_card.css">
    <link rel="stylesheet" type="text/css" href="../../css/portal/search.css">
</head>

<script>

    var tid = "";
    var isHot = "";
    var isNew = "";

    $(function () {
        $(".filter p a").click(function () {
            $(this).siblings().removeClass("current");
            $(this).addClass("current");

            tid = $("a[mtype][class='current']").attr("value");
            isHot = $("a[isHot][class='current']").attr("value");
            isNew = $("a[isNew][class='current']").attr("value");

            window.location.href = "/song/list?tid=" + tid + "&isHot=" + isHot + "&isNew=" + isNew;
        })

        tid = $("#tid").val();
        isHot = $("#isHot").val();
        isNew = $("#isNew").val();

        //流派回显
        $("a[mtype][class='current']").removeClass("current");
        $("a[mtype][value='" + tid + "']").addClass("current");

        //热门回显
        $("a[isHot][class='current']").removeClass("current");
        $("a[isHot][value='" + isHot + "']").addClass("current");

        //新歌回显
        $("a[isNew][class='current']").removeClass("current");
        $("a[isNew][value='" + isNew + "']").addClass("current");
    })

    function loadMore() {
        var pageNoProtal = parseInt($("#pageNoProtal").val());
        var pageSize = parseInt($("#pageSize").val()) * (++pageNoProtal);
        window.location.href = "/song/list?tid=" + tid + "&isHot=" + isHot + "&isNew=" + isNew + "&pageSize=" + pageSize + "&pageNoProtal=" + pageNoProtal;
    }

    function play() {
        window.open("/song/play", "play")
    }

    function selectallornot(obj) {
        var $checked = $(obj).attr("checked");
        if ($checked == "checked") {
            $("#content tr input[type='checkbox']").attr("checked", "checked");
        } else {
            $("#content tr input[type='checkbox']").removeAttr("checked");
        }
    }

    function playsongs() {
        var sid = "";
        $("#content tr input[type='checkbox']:checked").each(function () {
            sid = sid + $(this).val() + ",";
        });
        window.location.href = "/song/play?sid=" + sid;
    }

    function play(sid) {
        window.location.href = "/song/play?sid=" + sid;
    }
</script>

<body data-spm="7400859">
<div id="header" data-spm="226669510">
    <div class="primary">
        <div class="gap">
            <div class="wrapper">
                <table>
                    <tr>
                        <td class="logo"><a href="#" title="虾米音乐网(xiami.com) - 高品质音乐 发现 分享">虾米音乐网(xiami.com) - 高品质音乐
                            发现
                            分享</a></td>
                        <td class="nav">
                            <a class="bigtext " href="#">发现音乐</a>
                            <a class="bigtext " href="#">我的音乐</a>
                        </td>
                        <td class="subnav">
                            <a class="bigtext first current" href="#">歌曲</a>
                            <a class="bigtext first  " href="#">歌单</a>
                            <a class="bigtext middle  " href="#">电台</a>
                            <a class="bigtext middle  " href="#">音乐人</a>
                        </td>
                        <td class="search">
                            <div class="container">
                                <div class="form">
                                    <input id="key" class="keyword" autocomplete="off" onkeydown="keydownEvent()"
                                           placeholder="音乐搜索，找人..." name="key"/>
                                    <input class="icon submit" onclick="submitQuery('query')" type="button" value=""
                                           title="搜索"/>
                                    <input type="hidden" id="pageCode" value="${qcode}">
                                </div>
                                <div class="auto_complete"></div>
                            </div>
                        </td>
                        <td class="bigtext login">
                            <a class="first" href="#">免费注册</a>
                            <a class="last"
                               href="#">立即登录</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="../../css/portal/songs.css">

<div id="body" class="gap">
    <input id="tid" type="hidden" value="${mq.tid}">
    <input id="isHot" type="hidden" value="${mq.isHot}">
    <input id="isNew" type="hidden" value="${mq.isNew}">
    <div class="wrapper">
        <div class="content_wrapper">
            <div class="content">
                <div class="filter" data-spm="1392350033">
                    <dl>
                        <dt>流派&nbsp;:</dt>
                        <dd>
                            <p>
                                <a href="#" mtype value="" class="current">全部</a>
                                <c:forEach items="${mtypes}" var="m">
                                    <a href="#" mtype value="${m.tid}">${m.tname}</a>
                                </c:forEach>
                            </p>
                        </dd>
                    </dl>
                    <dl>
                        <dt>类型&nbsp;:</dt>
                        <dd>
                            <p>
                                <a href="#" isHot value="" class="current">全部</a>
                                <a href="#" isHot value="1">热门</a>
                            </p>
                        </dd>
                    </dl>
                    <dl>
                        <dt>排序&nbsp;:</dt>
                        <dd>
                            <p>
                                <a href="#" isNew value="" class="current">全部</a>
                                <a href="#" isNew value="1">最新</a>
                            </p>
                        </dd>
                    </dl>
                </div>
                <div class="chart" data-spm="1392350021">
                    <table>
                        <thead>
                        <tr>
                            <td width="40"></td>
                            <td width="45"></td>
                            <td></td>
                            <td width="180"></td>
                            <td width="180"></td>
                            <td width="130"></td>
                        </tr>
                        <tr>
                            <th align="right"><input type="checkbox" checked="checked" onclick="selectallornot(this);">
                            </th>
                            <th align="left" colspan="5"><b class="play" onclick="playsongs();"></b>
                            </th>
                        </tr>
                        </thead>
                        <tbody id="content">
                        <c:forEach items="${page.list}" var="p" varStatus="v">
                            <tr data-index="0">
                                <td align="right"><input type="checkbox" name="chartids" checked="checked"
                                                         value="${p.sid}"></td>
                                <td align="center">${v.count}</td>
                                <td>
                                    <div class="song">
                                        <div class="image">
                                            <img src="${filePath}${p.songer.pic}"
                                                 alt="Every Breath You Take" height="55" width="55"/>
                                            <b></b>
                                        </div>
                                        <div class="info"><p><strong><a target="_blank" title="Every Breath You Take"
                                                                        href="https://emumo.xiami.com/song/1770112914">${p.sname}</a></strong>
                                        </p></div>
                                    </div>
                                </td>
                                <td><span>
                                            <a target="_blank" href="https://i.xiami.com/karensouza"
                                               title="Karen Souza">${p.songer.srname}</a>
                                    	</span></td>
                                <td><span>
                <a target="_blank" title="Essentials" href="https://emumo.xiami.com/album/432660">${p.album.aname}</a>
            </span></td>
                                <td>
                                    <div class="action">
                                        <button class="play" onclick="play(${p.sid});" title="试听">试听</button>
                                        <button class="download" title="下载">下载</button>
                                        <button class="offline" title="发送到">发送到</button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <input type="hidden" value="${mq.pageNoProtal}" id="pageNoProtal">
                <input type="hidden" value="${mq.pageSize}" id="pageSize">
                <c:if test="${page.pageNo < page.totalPage}">
                    <div class="loadr" id="loader"><a href="javascript:void(0);" onclick="loadMore()"><b></b>查看更多</a>
                    </div>
                </c:if>
                <c:if test="${page.pageNo == page.totalPage}">
                    <div class="loadr" id="nomore" style="font-size: 18px;">没有更多啦!</div>
                </c:if>
            </div>
        </div>
        <div class="sidebar" data-spm="1392350021">
            <div class="nav">
                <a class="index" href="#"><b></b>发现</a>
                <a class="top" href="#"><b></b>排行榜</a>
                <a class="magazines" href="#"><b></b>音乐人企划</a>
                <a class="artists" href="/songer/list"><b></b>音乐人</a>
                <a class="songs current" href="#"><b></b>歌曲</a>
                <a class="albums" href="#"><b></b>专辑<sup>无损</sup></a>
            </div>
            <div class="genre">
                <c:forEach items="${mtypes}" var="m">
                    <a href="/song/list?tid=${m.tid}" tid="${m.tid}"><b></b>${m.tname}</a>
                </c:forEach>
            </div>
        </div>
    </div>

</div>

<div id="footer" data-spm="1110930425">
    <div class="gap">
        <div class="wrapper">
            <div class="content">
                <div class="sitemap">

                    <dl>
                        <dt>关于</dt>
                        <dd><a title="关于我们" href="#">关于我们</a></dd>
                        <dd><a title="虾米招聘" href="#" target="_blank">虾米招聘</a><sup class="hot"></sup></dd>
                        <dd><a title="独立音乐人合作" href="#" target="_blank">独立音乐人合作</a></dd>
                        <dd><a title="联系我们" href="#">联系我们</a></dd>
                        <dd><a title="友情链接" href="#">友情链接</a></dd>
                        <dd><a title="知识产权声明及隐私权政策" href="#">知识产权声明及隐私权政策</a></dd>
                        <dd><a title="版权投诉" href="#">版权投诉</a></dd>
                    </dl>

                    <dl>
                        <dt>特色服务</dt>
                        <dd><a title="虾米 VIP" href="#">虾米 VIP</a></dd>
                        <dd><a title="虾米播播" href="#">虾米播播</a></dd>
                        <dd><a title="音乐专题" href="https://emumo.xiami.com/events">音乐专题</a></dd>
                    </dl>

                    <dl>
                        <dt>虾米客户端</dt>
                        <dd><a title="虾米 for iPhone" href="#">虾米 for iPhone</a><sup class="hot"></sup></dd>
                        <dd><a title="虾米 for Android" href="#">虾米 for Android</a></dd>
                        <dd><a title="虾米 for Windows" href="#">虾米 for Windows</a></dd>
                        <dd><a title="虾米 for Mac" href="#">虾米 for Mac</a></dd>
                        <dd><a title="虾米 for iPad" href="#">虾米 for iPad</a></dd>
                    </dl>

                    <dl>
                        <dt>更多</dt>
                        <dd><a title="分类找歌" href="#">分类找歌</a></dd>
                        <dd><a title="帮助中心" href="#">帮助中心</a></dd>
                        <dd><a title="添加虾米还没有的资料" href="#">添加虾米还没有的资料</a></dd>
                        <dd><a title="提交大家想要的专辑" href="#">提交大家想要的专辑</a></dd>
                        <dd><a title="音频上传" href="#">音频上传</a></dd>
                        <dd><a title="MV上传" href="#">MV上传</a></dd>
                        <dd><a title="添加歌词" href="#">添加歌词</a></dd>
                    </dl>
                </div>


            </div>


        </div>


        <div style="background:#fff; margin: 0 auto;display:none;">
            <font style="font-size:12px; color:#fff;">Host: ,
                Process All 0.2863s Memory:3936.69k <br></font>
        </div>
        <div style="position:absolute;left:0;bottom:0;z-index:0;">
            <object id="plugin0" type="application/x-sharetingplugin" width="1" height="1">
            </object>
        </div>
    </div>
</div>
</body>
</html>

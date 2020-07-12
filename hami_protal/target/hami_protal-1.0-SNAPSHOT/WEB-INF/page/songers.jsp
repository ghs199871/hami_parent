<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ include file="header.jsp" %>
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

    <link rel="shortcut icon" href="/favicon.ico"/>

    <link rel="stylesheet" type="text/css" href="/css/portal/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/portal/base.css">
    <link rel="stylesheet" type="text/css" href="/css/portal/old.css">
    <link rel="stylesheet" type="text/css" href="/css/portal/header.css">
    <link rel="stylesheet" type="text/css" href="/css/portal/name_card.css">
    <link rel="stylesheet" type="text/css" href="/css/portal/search.css">
    <link rel="stylesheet" href="//img.xiami.net/music/music-static/0.6.2/musician/albums.css">

    <script>
        $(function () {
            var tid = "";
            var isHot = "";
            $(function () {

                //指定点击事件
                $(".filter p a").click(function () {
                    //移除同辈的a链接的样式
                    $(this).siblings().removeClass("current");
                    //把点击的a链接的样式加上
                    $(this).addClass("current");
                    //获得流派的选中值
                    var tid = $("a[ftype='mtype'][class='current']").attr("value");
                    var isHot = $("a[ftype='isHot'][class='current']").attr("value");
                    //alert(tid+"   "+isHot+"   "+isNew);

                    window.location.href = "/songer/list?tid="+tid+"&isHot="+isHot;
                })


                tid = $("#tid").val();
                isHot = $("#isHot").val();
                //流派的回显
                $("a[ftype='mtype'][class='current']").removeClass("current");
                $("a[ftype='mtype'][value='"+tid+"']").addClass("current");
                //热门回显
                $("a[ftype='isHot'][class='current']").removeClass("current");
                $("a[ftype='isHot'][value='"+isHot+"']").addClass("current");



            })

            function loadMore() {
                var pageNoPortal = parseInt($("#pageNoPortal").val());
                //计算pageSize
                var pageSize = 5*(++pageNoPortal);
                window.location.href = "/song/list?tid="+tid+"&isHot="+isHot+"&pageSize="+pageSize+"&pageNoPortal="+pageNoPortal;
            }
        })
    </script>


</head>

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
<link rel="stylesheet" href="/css/portal/songs.css">

<div id="body" class="gap">
    <input id="tid" type="hidden" value="${mq.tid}">
    <input id="isHot" type="hidden" value="${mq.isHot}">
    <div class="wrapper">
        <div class="content_wrapper">
            <div class="content">
                <div class="filter" data-spm="1392350033">
                    <dl>
                        <dt>流派&nbsp;:</dt>
                        <dd>
                            <p>
                                <a href="#" ftype="mtype" value="" class="current">全部</a>
                                <c:forEach items="${mtypes}" var="mtype">
                                    <a href="#" ftype="mtype" value="${mtype.tid}">${mtype.tname}</a>
                                </c:forEach>
                            </p>
                        </dd>
                    </dl>
                    <dl>
                        <dt>热门&nbsp;:</dt>
                        <dd>
                            <p>
                                <a href="#" ftype="isHot" value="" class="current">全部</a>
                                <a href="#" ftype="isHot" value="1">热门</a>

                            </p>
                        </dd>
                    </dl>
                </div>


                <div class="albums" data-spm="1392350021">
                    <c:forEach items="${sList}" var="subList">
                        <div class="album_list">
                            <c:forEach items="${subList}" var="songer">
                                <div class="album" data-needpay="0" data-playstatus="1" data-downloadstatus="1">
                                    <div class="image">
                                        <a target="_blank" title="${songer.srname}" href="/songer/getSonger?srid=${songer.srid}">
                                            <img src="${filePath}${songer.pic}" alt="${songer.srname}">

                                            <b class="icon toplay" onclick="playalbum(406532);return false;" style="display: none;"></b>
                                            <dl style="display: none;">
                                                <dt>
                                                    <b class="icon toheart"></b>
                                                    <b class="icon todropmenu"></b>
                                                </dt>
                                                <dd style="display: none;">
                                                    <ul>
                                                        <li onclick="tag(406532,5);return false;"><b class="icon tofavourite"></b>收藏</li>
                                                        <li onclick="album2collect(406532);return false;"><b class="icon tocollect"></b>添加到</li>
                                                        <li onclick="recommend(406532,33);return false;"><b class="icon toshare"></b>分享到</li>
                                                    </ul>
                                                </dd>
                                            </dl>
                                            <sup title="${songer.srname}"></sup>			</a>
                                    </div>
                                    <div class="info">

                                        <p>
                                            <a target="_blank" title="${songer.srname}" href="#">${songer.srname}</a>
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:forEach>


                </div>

                <input type="hidden" id="pageNoPortal" value="${mq.pageNoProtal}">
                <c:if test="${page.pageNo < page.totalPage}">
                    <div class="loadr" id="loader"><a href="javascript:void(0);" onclick="loadMore()"><b></b>查看更多</a></div>
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
                <a class="artists current" href="#"><b></b>音乐人</a>
                <a class="songs " href="/song/list"><b></b>歌曲</a>
                <a class="albums" href="#"><b></b>专辑<sup>无损</sup></a>
            </div>
            <div class="genre">
                <c:forEach items="${mtypes}" var="mtype">
                    <a href="/songer/list?tid=${mtype.tid}"><b></b>${mtype.tname}</a>
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
<script type="text/javascript" src="/js/common/jquery-1.8.3.js"></script>
<script type="text/javascript" src="/js/portal/search.js"></script>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String pathname = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
    pageContext.setAttribute("path", pathname);
%>
<html>
<head>
    <base href="<%=pathname %>"/>
    <meta charset="UTF-8">
    <!-- 移动端更好的适应 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dist/semantic/semantic.min.css" >
    <link rel="stylesheet" href="css/my.css">
    <link rel="stylesheet" href="css/typo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="lib/prism/prism.css">
    <link rel="stylesheet" href="lib/tocbot/tocbot.css">
    <title>博客详情</title>
</head>
<body>
<!-- 导航开始 -->
<nav th:replace="_fragments :: menu(0)" class="ui inverted attached segment m-padded-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">Blog</h2>
            <a href="#" class="m-item item m-mobile-hide"><i class="home icon"></i>首页</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="clone icon"></i>归档</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="info icon"></i>关于我</a>
            <div class="right m-item item m-mobile-hide">
                <div class="ui action input">
                    <input type="text" placeholder="输入关键字">
                    <button class="ui button">搜索</button>
                </div>
            </div>
        </div>
    </div>

    <a href="#" class="ui m-menu m-toggle black icon button m-right-top m-mobile-show">
        <i class="sidebar icon"></i>
    </a>
</nav>
<!-- 导航结束 -->


<!-- 中间内容开始 -->
<div id="waypoint" class="m-container m-padded-large">
    <div class="ui container animated fadeIn">
        <!-- 中间内容头部信息开始 -->
        <div class="ui top attached segment">
            <div class="ui horizontal link list">
                <div class="item">
                    <img src="${path}images/me.jpg" alt="头像" class="ui avatar image"/>
                    <div class="content"><a href="#" class="header" th:text="${post.nickname}">吴慧华</a></div>
                </div>
                <div class="item">
                    <i class="calendar icon"></i><span>2020-01-01</span>
                </div>
                <div class="item">
                    <i class="eye icon"></i><span th:text="${post.readCount}">1000</span>
                </div>
            </div>
        </div>
        <!-- 中间内容头部信息结束 -->

        <!-- 中间内容图片开始 -->
        <div class="ui attached segment">
            <img src="${path}images/test1.jpg" alt="首图" class="ui fluid rounded image">
        </div>
        <!-- 中间内容图片结束 -->

        <!-- 中间内容博客内容开始 -->
        <div class="ui attached padded segment">
            <div class="ui right aligned basic segment">
                <div class="ui green basic label" th:text="${post.mark}==1?'原创':'转载'">转载</div>
            </div>
            <h2 class="ui center aligned header" th:text="${post.title}">博客详情测试</h2>
            <!-- 博客具体内容 -->
            <div id="m-id-content" class="typo typo-selection js-toc-content m-padded-left-right-responsive m-padded-large" th:utext="${post.content}">

                <pre><code class="language-css">p { color: red}</code></pre>

                <h1 id="1">中文网页重设与排版：<i class="serif">Typo.css</i></h1><br/>

                <h2 id="tagline" class="serif">一致化浏览器排版效果，构建最适合中文阅读的网页排版</h2>

                <ol id="table">
                    <li><a href="#section1">关于 <i class="serif">Typo.css</i></a></li>
                    <li><a href="#section2">排版实例</a>
                        <ul>
                            <li><a href="#section2-1">例1：论语学而篇第一</a></li>
                        </ul>
                    </li>
                    <li><a href="#section3">附录</a>
                        <ul>
                            <li><a href="#appendix1"><i class="serif">Typo.css</i> 排版偏重点</a></li>
                            <li><a href="#appendix2">开源许可</a></li>
                        </ul>
                    </li>
                </ol>

                <h2 id="section1">一、关于 <i class="serif">Typo.css</i></h2>

                <p><i class="serif">Typo.css</i> 的目的是，在一致化浏览器排版效果的同时，构建最适合中文阅读的网页排版。</p>
                <h4 id="www">现状和如何去做：</h4>

                <p class="typo-first">排版是一个麻烦的问题 <sup><a href="#appendix1"># 附录一</a></sup>，需要精心设计，而这个设计却是常被视觉设计师所忽略的。前端工程师更常看到这样的问题，但不便变更。因为在多个
                    OS 中的不同浏览器渲染不同，改动需要多的时间做回归测试，所以改变变得更困难。而像我们一般使用的
                    Yahoo、Eric Meyer 和 Alice base.css 中采用的 Reset 都没有很好地考虑中文排版。<i class="serif">Typo.css</i>
                    要做的就是解决中文排版的问题。</p>

                <p><strong><i class="serif">Typo.css</i> 测试于如下平台：</strong></p>
                <table>
                    <thead>
                    <tr>
                        <th>OS/浏览器</th>
                        <th>Firefox</th>
                        <th>Chrome</th>
                        <th>Safari</th>
                        <th>Opera</th>
                        <th>IE9</th>
                        <th>IE8</th>
                        <th>IE7</th>
                        <th>IE6</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>OS X</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>Win 7</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>Win XP</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>-</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>✔</td>
                    </tr>
                    <tr>
                        <td>Ubuntu</td>
                        <td>✔</td>
                        <td>✔</td>
                        <td>-</td>
                        <td>✔</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    </tr>
                    </tbody>
                </table>

                <h4 id="xxx">中文排版的重点和难点</h4>

                <p>在中文排版中，HTML4 的很多标准在语义在都有照顾到。但从视觉效果上，却很难利用单独的 CSS 来实现，像<abbr title="在文字下多加一个点">着重号</abbr>（例：这里<em
                        class="typo-em">强调一下</em>）。在 HTML4 中，专名号标签（<code>&lt;u&gt;</code>）已经被放弃，而
                    HTML5 被<a href="//html5doctor.com/u-element/">重新提起</a>。<i class="serif">Typo.css</i>
                    也根据实际情况提供相应的方案。我们重要要注意的两点是：</p>
                <ol>
                    <li>语义：语义对应的用法和样式是否与中文排版一致</li>
                    <li>表现：在各浏览器中的字体、大小和缩放是否如排版预期</li>
                </ol>
                <p>对于这些，<i class="serif">Typo.css</i> 排版项目的中文偏重注意点，都添加在附录中，详见：</p>
                <blockquote>
                    <b>附录一</b>：<a href="#appendix1"><i class="serif">Typo.css</i> 排版偏重点</a>
                </blockquote>

                <p>目前已有像百姓网等全面使用 <i class="serif">Typo.css</i> 的项目，测试平台的覆盖，特别是在<abbr title="手机、平板电脑等移动平台">移动端</abbr>上还没有覆盖完主流平台，希望有能力的同学能加入测试行列，或者加入到
                    <i class="serif">Typo.css</i>
                    的开发。加入方法：<a href="https://github.com/sofish/Typo.css">参与 <i class="serif">Typo.css</i> 开发</a>。如有批评、建议和意见，也随时欢迎给在
                    Github 直接提 <a
                            href="https://github.com/sofish/Typo.css/issues">issues</a>，或给<abbr
                            title="Sofish Lin, author of Typo.css">我</abbr>发<a href="mailto:sofish@icloud.com">邮件</a>。
                </p>


                <h2 id="section2">二、排版实例：</h2>

                <p>提供2个排版实例，第一个中文实例来自于来自于<cite class="typo-unique">张燕婴</cite>的《论语》，由于古文排版涉及到的元素比较多，所以采用《论语》中《学而》的第一篇作为排版实例介绍；第2个来自到经典的
                    Lorem Ipsum，并加入了一些代码和列表等比较具有代表性的排版元素。</p>

                <h3 id="section2-1">例1：论语学而篇第一</h3>

                <p>
                    <small><b>作者：</b><abbr title="名丘，字仲尼">孔子</abbr>（
                        <time>前551年9月28日－前479年4月11日</time>
                        ）
                    </small>
                </p>

                <h4 id="2">本篇引语</h4>

                <p>
                    《学而》是《论语》第一篇的篇名。《论语》中各篇一般都是以第一章的前二三个字作为该篇的篇名。《学而》一篇包括16章，内容涉及诸多方面。其中重点是「吾日三省吾身」；「节用而爱人，使民以时」；「礼之用，和为贵」以及仁、孝、信等道德范畴。 </p>

                <h4 id="3">原文</h4>

                <p>子曰：「学而时习之，不亦说乎？有朋自远方来，不亦乐乎？人不知，而不愠，不亦君子乎？」 </p>

                <h4 id="4">译文</h4>

                <p>孔子说：「学了又时常温习和练习，不是很愉快吗？有志同道合的人从远方来，不是很令人高兴的吗？人家不了解我，我也不怨恨、恼怒，不也是一个有德的君子吗？」 </p>

                <h4 id="5">评析</h4>

                <p>宋代著名学者<u class="typo-u">朱熹</u>对此章评价极高，说它是「入道之门，积德之基」。本章这三句话是人们非常熟悉的。历来的解释都是：学了以后，又时常温习和练习，不也高兴吗等等。三句话，一句一个意思，前后句子也没有什么连贯性。但也有人认为这样解释不符合原义，指出这里的「学」不是指学习，而是指学说或主张；「时」不能解为时常，而是时代或社会的意思，「习」不是温习，而是使用，引申为采用。而且，这三句话不是孤立的，而是前后相互连贯的。这三句的意思是：自己的学说，要是被社会采用了，那就太高兴了；退一步说，要是没有被社会所采用，可是很多朋友赞同<abbr
                        title="张燕婴">我</abbr>的学说，纷纷到我这里来讨论问题，我也感到快乐；再退一步说，即使社会不采用，人们也不理解我，我也不怨恨，这样做，不也就是君子吗？（见《齐鲁学刊》1986年第6期文）这种解释可以自圆其说，而且也有一定的道理，供读者在理解本章内容时参考。
                </p>

                <p>
                    此外，在对「人不知，而不愠」一句的解释中，也有人认为，「人不知」的后面没有宾语，人家不知道什么呢？当时因为孔子有说话的特定环境，他不需要说出知道什么，别人就可以理解了，却给后人留下一个谜。有人说，这一句是接上一句说的，从远方来的朋友向我求教，我告诉他，他还不懂，我却不怨恨。这样，「人不知」就是「人家不知道我所讲述的」了。这样的解释似乎有些牵强。</p>

                <p>总之，本章提出以学习为乐事，做到人不知而不愠，反映出孔子学而不厌、诲人不倦、注重修养、严格要求自己的主张。这些思想主张在《论语》书中多处可见，有助于对第一章内容的深入了解。</p>


                <h4 id="6">List style in action</h4>
                <ul>
                    <li>If you wish to succeed, you should use persistence as your good friend, experience as your
                        reference, prudence as
                        your brother and hope as your sentry.
                        <p>如果你希望成功，当以恒心为良友，以经验为参谋，以谨慎为兄弟，以希望为哨兵。</p>
                    </li>
                    <li>Sometimes one pays most for the things one gets for nothing.
                        <p>有时候一个人为不花钱得到的东西付出的代价最高。</p>
                    </li>
                    <li>Only those who have the patience to do simple things perfectly ever acquire the skill to do
                        difficult things
                        easily.
                        <p>只有有耐心圆满完成简单工作的人，才能够轻而易举的完成困难的事。</p>
                    </li>
                </ul>

                <h4 id="7">You may want to create a perfect <code>&lt;hr /&gt;</code> line, despite the fact that there
                    will never have one
                </h4>
                <hr/>
                <pre>
/* 标题应该更贴紧内容，并与其他块区分，margin 值要相应做优化 */
h1,h2,h3,h4,h5,h6 {
    line-height:1;font-family:Arial,sans-serif;margin:1.4em 0 0.8em;
}
h1{font-size:1.8em;}
h2{font-size:1.6em;}
h3{font-size:1.4em;}
h4{font-size:1.2em;}
h5,h6{font-size:1em;}

/* 现代排版：保证块/段落之间的空白隔行 */
.typo p, .typo pre, .typo ul, .typo ol, .typo dl, .typo form, .typo hr {
    margin:1em 0 0.6em;
}
</pre>

                <h3 id="section3">三、附录</h3>

                <h5 id="appendix1">1、<i class="serif">Typo.css</i> 排版偏重点</h5>
                <table>
                    <thead>
                    <tr>
                        <th>类型</th>
                        <th>语义</th>
                        <th>标签</th>
                        <th>注意点</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th rowspan="15">基础标签</th>
                        <td>标题</td>
                        <td><code>h1</code> ～ <code>h6</code></td>
                        <td>全局不强制大小，<code>.typo</code> 中标题与其对应的内容应紧贴，并且有相应的大小设置</td>
                    </tr>
                    <tr>
                        <td>上、下标</td>
                        <td><code>sup</code>/<code>sub</code></td>
                        <td>保持与 MicroSoft Office Word 等程序的日常排版一致</td>
                    </tr>
                    <tr>
                        <td>引用</td>
                        <td><code>blockquote</code></td>
                        <td>显示/嵌套样式</td>
                    </tr>
                    <tr>
                        <td>缩写</td>
                        <td><code>abbr</code></td>
                        <td>是否都有下划线，鼠标 <code>hover</code> 是否为帮助手势</td>
                    </tr>
                    <tr>
                        <td>分割线</td>
                        <td><code>hr</code></td>
                        <td>显示的 <code>padding</code> 和 <code>margin</code>正确</td>
                    </tr>
                    <tr>
                        <td>列表</td>
                        <td><code>ul</code>/<code>ol</code>/<code>dl</code></td>
                        <td>在全局没有 <code>list-style</code>，在 .<code>typo</code> 中对齐正确</td>
                    </tr>
                    <tr>
                        <td>定义列表</td>
                        <td><code>dl</code></td>
                        <td>全局 <code>padding</code> 和 <code>margin</code>为0， .<code>typo</code> 中对齐正确</td>
                    </tr>
                    <tr>
                        <td>选项</td>
                        <td><code>input[type=radio[, checkbox]]</code></td>
                        <td>与其他 <code>form</code> 元素排版时是否居中</td>
                    </tr>
                    <tr>
                        <td>斜体</td>
                        <td><code>i</code></td>
                        <td>只设置一种斜体，让 <code>em</code> 和 <code>cite</code> 显示为正体</td>
                    </tr>
                    <tr>
                        <td>强调</td>
                        <td><code>em</code></td>
                        <td>在全局显示正体，在 <code>.typo</code> 中显示与 <code>b</code> 和 <code>strong</code> 的样式一致，为粗体</td>
                    </tr>
                    <tr>
                        <td>加强</td>
                        <td><code>strong/b</code></td>
                        <td>显示为粗体</td>
                    </tr>
                    <tr>
                        <td>标记</td>
                        <td><code>mark</code></td>
                        <td>类似荧光笔</td>
                    </tr>
                    <tr>
                        <td>印刷</td>
                        <td><code>small</code></td>
                        <td>保持为正确字体的 80% 大小，颜色设置为浅灰色</td>
                    </tr>
                    <tr>
                        <td>表格</td>
                        <td><code>table</code></td>
                        <td>全局不显示线条，在 <code>table</code> 中显示表格外框，并且表头有浅灰背景</td>
                    </tr>
                    <tr>
                        <td>代码</td>
                        <td><code>pre</code>/<code>code</code></td>
                        <td>字体使用 <code>courier</code> 系字体，保持与 <code>serif</code> 有比较一致的显示效果</td>
                    </tr>
                    <tr>
                        <th rowspan="5">特殊符号</th>
                        <td>着重号</td>
                        <td><em class="typo-em">在文字下加点</em></td>
                        <td>在支持 <code>:after</code> 和 <code>:before</code> 的浏览器可以做渐进增强实现</td>
                    </tr>
                    <tr>
                        <td>专名号</td>
                        <td><u>林建锋</u></td>
                        <td>专名号，有下划线，使用 <code>u</code> 或都 <code>.typo-u</code> 类</td>
                    </tr>
                    <tr>
                        <td>破折号</td>
                        <td>——</td>
                        <td>保持一划，而非两划</td>
                    </tr>
                    <tr>
                        <td>人民币</td>
                        <td>&yen;</td>
                        <td>使用两平等线的符号，或者 HTML 实体符号 <code>&amp;yen;</code></td>
                    </tr>
                    <tr>
                        <td>删除符</td>
                        <td>
                            <del>已删除（deleted）</del>
                        </td>
                        <td>一致化各浏览器显示，中英混排正确</td>
                    </tr>
                    <tr>
                        <th rowspan="3">加强类</th>
                        <td>专名号</td>
                        <td><code>.typo-u</code></td>
                        <td>由于 <code>u</code> 被 HTML4 放弃，在向后兼容上推荐使用 <code>.typo-u</code></td>
                    </tr>
                    <tr>
                        <td>着重符</td>
                        <td><code>.typo-em</code></td>
                        <td>利用 <code>:after</code> 和 <code>:before</code> 实现着重符</td>
                    </tr>
                    <tr>
                        <td>清除浮动</td>
                        <td><code>.clearfix</code></td>
                        <td>与一般 CSS Reset 保持一对致 API</td>
                    </tr>
                    <tr>
                        <th rowspan="5">注意点</th>
                        <td colspan="3">（1）中英文混排行高/行距</td>
                    </tr>
                    <tr>
                        <td colspan="3">（2）上下标在 IE 中显示效果</td>
                    </tr>
                    <tr>
                        <td colspan="3">（3）块/段落分割空白是否符合设计原则</td>
                    </tr>
                    <tr>
                        <td colspan="3">（4）input 多余空间问题</td>
                    </tr>
                    <tr>
                        <td colspan="3">（5）默认字体色彩，目前采用 <code>#333</code> 在各种浏览显示比较好</td>
                    </tr>
                    </tbody>
                </table>

                <h5 id="appendix2">2、开源许可</h5>

                <p><i class="serif">Typo.css</i> 基于 <a href="//zh.wikipedia.org/wiki/MIT_License">MIT License</a>
                    开源，使用代码只需说明来源，或者引用 <a
                            href="//typo.sofi.sh/license.txt">license.txt</a> 即可。</p>
            </div>
            <br>
            <!-- 标签 -->
            <div class=".m-padded-left-right-responsive">
                <div class="ui basic teal left pointing label" th:each="label:${post.labelNameList}" th:text="${label}">java</div>
            </div>
            <!-- 赞赏 -->
            <div class="ui center aligned basic segment">
                <button id="m-pay-button-id" class="ui orange basic circular button" th:if="${post.rewardStatus}">赞赏</button>
            </div>
            <div class="ui m-pay-q flowing popup transition hidden">
                <div class="ui orange basic label">
                    <div class="ui images" style="font-size: inherit !important;">
                        <div class="image">
                            <img src="${path}images/wechat.png" alt=""
                                 class="ui rounded bordered image" style="width: 120px">
                            <div>支付宝</div>
                        </div>
                        <div class="image">
                            <img src="${path}images/wechat.png"  alt=""
                                 class="ui rounded bordered image" style="width: 120px">
                            <div>微信</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- 中间内容博客内容结束 -->

        <!-- 中间内容博客其他信息开始 -->
        <div class="ui attached positive message">
            <div class="ui middle aligned grid">
                <div class="eleven wide column">
                    <ul class="list">
                        <li>作者：<span th:text="${post.nickname}">吴慧华</span><a href="#" th:href="@{/about}" target="_blank">（联系作者）</a></li>
                        <li>发表时间：<span>2020-01-01</span></li>
                        <li>版权声明：自由转载-不可商用-保持署名</li>
                        <li>转载说明：请在文前添加原作者以及原文链接</li>
                    </ul>
                </div>
                <div class="five wide column">
                    <img src="${path}images/wechat.png" alt="" class="ui right floated rounded bordered image" style="width: 110px">
                </div>
            </div>
        </div>
        <!-- 中间内容博客其他信息结束 -->

        <!-- 中间内容留言区域开始 -->
        <div class="ui bottom attached segment">
            <!-- 中间内容留言区域列表 -->
            <div id="comment-container" class="ui teal segment">
                <div th:fragment="commentList">
                    <div class="ui comments">
                        <h3 class="ui dividing header">评论区</h3>
                        <div class="comment" th:each="comment:${commentList}">
                            <a class="avatar">
                                <img src="${path}images/user1.jpg" th:src="@{${comment.picture}}" alt="头像">
                            </a>
                            <div class="content">
                                <a class="author" th:text="${comment.nickname}">Matt</a>
                                <div class="metadata">
                                    <span class="date">今天下午 5:42</span>
                                </div>
                                <div class="text" th:text="${comment.content}">太赞了！</div>
                                <div class="actions">
                                    <a class="reply" data-commentid="1" th:data-commentid="${comment.id}" data-commentnickname="Matt" th:data-commentnickname="${comment.nickname}" data-replyuserid="1" th:data-replyuserid="${comment.userId}" onclick="reply(this)">回复</a>
                                </div>
                            </div>
                            <div class="comments" th:if="${comment.commentReplyVoList}">
                                <div class="comment" th:each="commentReply:${comment.commentReplyVoList}">
                                    <a class="avatar">
                                        <img src="${path}images/user3.jpg" th:src="@{${commentReply.picture}}" alt="头像">
                                    </a>
                                    <div class="content">
                                        <a class="author" th:text="${commentReply.nickname}">Jenny Hess</a>
                                        <div class="metadata">
                                            <span class="date">刚刚</span>
                                        </div>
                                        <div class="text" th:text="${commentReply.content}">艾略特你永远是多么正确 :)</div>
                                        <div class="actions">
                                            <a class="reply"  data-commentid="1" th:data-commentid="${comment.id}" data-commentnickname="Jenny Hess" th:data-commentnickname="${commentReply.nickname}" data-replyuserid="1" th:data-replyuserid="${commentReply.userId}" onclick="reply(this)">回复</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/*-->
                        <div class="comment">
                            <a class="avatar">
                                <img src="${path}images/user2.jpg" th:src="@{/images/user2.jpg}" alt="">
                            </a>
                            <div class="content">
                                <a class="author">Elliot Fu</a>
                                <div class="metadata">
                                    <span class="date">昨天上午12:30</span>
                                </div>
                                <div class="text">
                                    <p>這對我的研究是非常有用.謝謝!</p>
                                </div>
                                <div class="actions">
                                    <a class="reply">回复</a>
                                </div>
                            </div>
                        </div>
                        <div class="comment">
                            <a class="avatar">
                                <img src="${path}images/user4.jpg" th:src="@{/images/user4.jpg}" alt="">
                            </a>
                            <div class="content">
                                <a class="author">Joe Henderson</a>
                                <div class="metadata">
                                    <span class="date">5 天以前</span>
                                </div>
                                <div class="text">老兄，这太棒了。非常感谢。</div>
                                <div class="actions">
                                    <a class="reply">回复</a>
                                </div>
                            </div>
                        </div>
                        <!--*/-->
                    </div>
                </div>
            </div>
            <div id="comment-form" class="ui form">
                <input type="hidden" name="userId" th:value="${session.SPRING_SECURITY_CONTEXT}!=null?${session.SPRING_SECURITY_CONTEXT.authentication.principal.id}">
                <input type="hidden" name="postId" th:value="${post.id}">
                <input type="hidden" name="commentId" value="-1">
                <input type="hidden" name="replyUserId" value="-1">
                <input type="hidden" name="commentNickname" value="">
                <div class="field">
                    <textarea name="content" placeholder="请输入评论信息 ... "></textarea>
                </div>
                <button id="comment-btn" type="button" class="ui teal right floated button m-mobile-wide"><i class="edit icon"></i>评论</button>
                <div class="field"><div class="ui error mini message"></div></div>
            </div>
        </div>
        <!-- 中间内容留言区域结束 -->
    </div>
</div>
<!-- 中间内容结束 -->


<!-- 右边小工具条开始 -->
<div id="toolbar" class="m-padded-all m-fixed m-right-top-big" style="display: none;">
    <div class="ui vertical icon buttons ">
        <button type="button" class="ui toc-button teal button">目录</button>
        <a href="#comment-container" class="ui teal button">评论</a>
        <button class="ui teal mobileReadBut icon button"><i class="mobile alternate icon"></i></button>
        <div id="toTop-button" class="ui teal icon button"><i class="chevron up icon"></i></div>
    </div>
</div>
<div class="ui toc-container flowing popup transition hidden" style="width: 300px !important;">
    <ol class="js-toc">

    </ol>
</div>
<div id="qrcode" class="ui mobileRead flowing popup transition hidden" style="width: 130px !important"></div>
<!-- 右边小工具条结束 -->

<!-- 底部内容开始 -->
<footer th:replace="_fragments :: footer" class="ui inverted vertical segment m-padded-massive">
    <div class="ui center aligned container">
        <div class="ui inverted divided stackable grid">
            <div class="three wide column">
                <div class="ui inverted link list">
                    <div class="item">
                        <img src="${path}images/wechat.png" class="ui rounded image" alt="" style="width: 110px"/>
                    </div>

                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced">最新博客</h4>
                <div class="ui inverted link list">
                    <a class="item" href="#">用户故事（UserStory）</a>
                    <a class="item" href="#">用户故事（UserStory）</a>
                    <a class="item" href="#">用户故事（UserStory）</a>
                    <a class="item" href="#">用户故事（UserStory）</a>
                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced">联系我</h4>
                <div class="ui inverted link list">
                    <a class="item" href="#">Email: 404069322@qq.com</a>
                    <a class="item" href="#">QQ: 404069322</a>
                </div>
            </div>
            <div class="seven wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced">介绍</h4>
                <p class="m-text-thin m-text-spaced m-opacity-mini">
                    这是我的个人博客，会分享关于编程、投资有关的任何内容，希望可以给大家带来帮助
                </p>
            </div>

        </div>
        <div class="ui inverted section divider"></div>
        <p class="m-text-thin m-text-spaced m-opacity-tiny">Copyright 2021 - 2022 </p>
    </div>
</footer>
<!-- 底部内容结束 -->


<script src="${path}dist/jquery/jquery-3.4.1.min.js" ></script>
<script src="${path}dist/semantic/semantic.min.js" ></script>
<script src="${path}lib/prism/prism.js" ></script>
<script src="${path}lib/tocbot/tocbot.js" ></script>
<script src="${path}lib/qrcode/qrcode.min.js" ></script>
<script src="${path}lib/scrollTo/scrollTo.min.js"></script>
<script src="${path}lib/waypoints/waypoints.min.js" ></script>

<script th:inline="javascript">
    $('.m-menu.m-toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });
    $('.ui.dropdown').dropdown({
        on: 'hover'
    });

    $('#m-pay-button-id').popup({
        popup: $('.m-pay-q.popup'),
        on: 'click',
        position: 'bottom center'
    });

    /* 初始化文章目录 */
    tocbot.init({
        // 指定在哪放置这个文章目录
        tocSelector: '.js-toc',
        // 需要指定为哪个里面的内容生成目录
        contentSelector: '.js-toc-content',
        // 指定生成的级别
        headingSelector: 'h1, h2, h3, h4',
        // For headings inside relative or absolute positioned containers within content.
        hasInnerContainers: true
    });

    $('.toc-button').popup({
        popup: $('.toc-container.popup'),
        on: 'click',
        position: 'left center'
    });
    $('.mobileReadBut').popup({
        popup: $('.mobileRead'),
        on: 'hover',
        position: 'left center'
    });

    let server = "localhost:8080"
    let url = /*[[@{/blog/detail/{id}(id=${post.id})}]]*/"";
    let qrcode = new QRCode("qrcode", {
        text: server + url,
        width: 100,
        height: 100,
        colorDark: "#000000",
        colorLight: "#ffffff",
        correctLevel: QRCode.CorrectLevel.H
    });

    $('#toTop-button').click(function () {
        $(window).scrollTo(0, 800);
    });

    let waypoint = new Waypoint({
        element: document.getElementById('waypoint'),
        handler: function (direction) {
            if (direction === 'down') {
                $('#toolbar').show(400);
            } else {
                $('#toolbar').hide(400);
            }
        }
    });

    //评论表单验证
    $('.ui.form').form({
        fields: {
            userId: {
                identifier: 'userId',
                rules: [{
                    type: 'empty',
                    prompt: '请先登录'
                }]
            },
            content: {
                identifier: 'content',
                rules: [{
                    type: 'empty',
                    prompt: '评论内容不能为空'
                }]
            }
        }
    });

    $('#comment-btn').click(function () {
        let flag = $('.ui.form').form('validate form');
        if (flag) {
            console.log('校验成功');
            postData();
        } else {
            console.log('校验失败');
        }

    });

    let userIdLabel = $("[name='userId']");
    let postIdLabel = $("[name='postId']");
    let commentIdLabel = $("[name='commentId']");
    let replyUserIdLabel = $("[name='replyUserId']");
    let commentNicknameLabel = $("[name='commentNickname']");
    let contentLabel = $("[name='content']");

    function postData() {
        $("#comment-container").load(/*[[@{/comment/add}]]*/"",{
            "userId" : userIdLabel.val(),
            "postId" : postIdLabel.val(),
            "commentId" : commentIdLabel.val(),
            "replyUserId" : replyUserIdLabel.val(),
            "content" : commentNicknameLabel.val() + " " + contentLabel.val()
        },function () {
            // $(window).scrollTo($('#comment-container'),500);
            clearContent();
        });
    }

    function clearContent() {
        contentLabel.val('');
        commentIdLabel.val(-1);
        contentLabel.attr("placeholder", "请输入评论信息...");
    }


    function reply(obj) {
        let commentId = $(obj).data('commentid');
        let commentNickname = $(obj).data('commentnickname');
        let replyUserId = $(obj).data('replyuserid');
        contentLabel.attr("placeholder", "@" + commentNickname).focus();
        commentNicknameLabel.val("@" + commentNickname);
        replyUserIdLabel.val(replyUserId);
        commentIdLabel.val(commentId);
        $(window).scrollTo($('#comment-form'),500);
    }

</script>
</body>
</html>

CREATE TABLE book(
   ID INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL,
   NAME           TEXT    NOT NULL,
   TITLE          TEXT    NOT NULL,
   DESC           TEXT    NOT NULL,
   URL            TEXT    NOT NULL,
   NOTEURL        TEXT    NOT NULL,
   PROCESS        INT     default 0,
   SCORE          REAL    default 3.5,
   START          TIMESTAMP default (datetime('now', 'localtime')),
   FINISH         TIMESTAMP default (datetime('now', 'localtime'))
);

INSERT INTO book  (NAME,TITLE,URL,DESC) VALUES ("解忧杂货店","无论多少苦恼，都会解决的","/static/images/11.jpg","僻静的街道旁有一家杂货店，只要写下烦恼投进店前门卷帘门的投信口，第二天就会在店后的牛奶箱里得到回答：因男友身患绝症，年轻女孩静子在爱情与梦想间徘徊；克郎为了音乐梦想离家漂泊，却在现实中寸步难行；少年浩介面临家庭巨变，挣扎在亲情与未来的迷茫中……
					他们将困惑写成信投进杂货店，奇妙的事情随即不断发生。生命中的一次偶然交会，将如何演绎出截然不同的人生？");
INSERT INTO book  (NAME,TITLE,URL,DESC) VALUES ("白夜行","","http://owzb2zgqv.bkt.clouddn.com/2.jpg","《白夜行》讲述了多年以前，大阪的一栋废弃建筑中发现一名遭利器刺死男子的故事。案件扑朔迷离，始终悬而未决。此后20年间，案件滋生出的恶逐渐萌芽生长，绽放出恶之花。案件相关者的人生逐渐被越来越重的阴影笼罩……
我的天空里没有太阳，总是黑夜，但并不暗，因为有东西代替了太阳。虽然没有太阳那么明亮，但对我来说已经足够。凭借着这份光，我便能把黑夜当成白天。我从来就没有太阳，所以不怕失去。
《白夜行》出版之后引起巨大轰动，使东野圭吾成为天王级作家。小说被改编成同名电视连续剧，与图书一同为作家带来了如潮好评，使他成为日本、韩国与中国台湾等地最受欢迎的作家之一。“只希望能手牵手在太阳下散步”，这句象征《白夜行》故事内核的绝望念想，有如一个美丽的幌子，随着无数凌乱、压抑、悲凉的事件片段如纪录片一样一一还原，最后一丝温情也被完全抛弃，万千读者在一曲救赎罪恶的爱情之中悲切动容。
");
INSERT INTO book  (NAME,TITLE,URL,DESC) VALUES ("嫌疑人X的献身","","http://owzb2zgqv.bkt.clouddn.com/1.jpg","《嫌疑人X的献身》创造了日本推理小说史上绝无仅有的奇迹，将第134届直木奖、第6届本格推理小说大奖及日本3大推理小说排行榜年度总冠军一并收入囊中。
数学天才石神，每天都去固定的便当店买午餐，只为看一眼在那里做事的邻居靖子。与女儿相依为命的靖子，失手杀了上门纠缠勒索的前夫。为救靖子，石神挺身料理善后，以数学家缜密的逻辑思考设了一个匪夷所思的局，为靖子提供了天衣无缝的不在场证据，以令人惊骇莫名的诡计诠释了一份无比真挚纯粹的爱情……");
INSERT INTO book  (NAME,TITLE,URL,DESC) VALUES ("恶意","","/static/images/14.jpg","畅销作家在出国前一晚被杀，警方很快锁定了凶手。此人供认自己是一时冲动犯下了罪行。案子到此已经可以了结。可办案的加贺警官并不这么认为，因为他找不到凶手作案的动机，凶手也一直对动机避而不谈。加贺不愿草草结案，大量走访。渐渐显露的真相让他感到冰冷的寒意——“你心里藏着对他的恶意，这仇恨深不见底，深得连你自己都无法解释。正是它导致了这起案件。这股恶意到底从何而起呢？我非常仔细地调查过，却实在找不出任何合乎逻辑的理由。这是怎样的一种心态啊！就算被捕也不怕，即使赌上自己的人生，也要达成目的。这真是惊人的想法，简直前所未闻。”");
INSERT INTO book  (NAME,TITLE,URL,DESC) VALUES ("彷徨之刃","","/static/images/15.jpg","《彷徨之刃》内容简介：长峰的女儿在看完烟火大会后彻夜未归，几天后尸体在荒川下游被人发现。正当长峰和警方都没有任何头绪时，他接到一个密报者的电话，知道了凶手的姓名和住址。长峰潜入凶手家，看到了女儿遭受凌虐致死的录像，愤怒痛恨到几近崩溃。一直以来的守法公民决定执行“法外正义”，他乔装打扮，走上了复仇之路。");
INSERT INTO book  (NAME,TITLE,URL,DESC) VALUES ("幻夜","","/static/images/16.jpg","《白夜行》姊妹篇 2004年入围第131届直木奖

是什么样的过去，造就了她的魔性？

是什么样的幻影，操纵着他的灵魂？

我们只能走在幻夜的路上，即使四周明亮有如白昼，那也仅是假象。

就算与你共度的每个夜晚都是幻夜，我也愿为你化身为影，至死不渝！

地震之后，宛如人间炼狱的断壁残垣中，水原雅也借机杀了舅舅，却被一神秘女子当场目击，她答应为水原终生保守秘密。

他们相偕前往东京，然而等待他们的，却是从此再无一丝太阳的无边幻夜：凡是接近过她的人，都遭逢厄运；凡是触碰过她过去的人，都不知所踪……

她，到底是谁？");
INSERT INTO book  (NAME,TITLE,URL,DESC) VALUES ("","","/static/images/14.jpg","");

INSERT INTO book  (NAME,TITLE,URL,DESC) VALUES ("","","/static/images/14.jpg","");

INSERT INTO book  (NAME,TITLE,URL,DESC) VALUES ("","","/static/images/14.jpg","");

INSERT INTO book  (NAME,TITLE,URL,DESC) VALUES ();
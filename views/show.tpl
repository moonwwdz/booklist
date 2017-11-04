<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2017书单</title>
<link rel="stylesheet" type="text/css" href="/static/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/static/css/lanrenzhijia.css" />
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="css/styleIE.css" />
<![endif]-->
<script src="/static/js/modernizr.custom.11333.js"></script>
</head>
<body>

<div id="ss-links" class="ss-links">
	{{range $index, $elem := .mList}}
	<a href="#month-id-{{$elem.N}}">{{$elem.C}}</a>
	{{end}}	
</div>

<div id="ss-container" class="ss-container">
	{{range $index, $elemM := .mListDesc}}
	<div class="ss-row">
		<div class="ss-left">
			<h2 id="month-id-{{$elemM.N}}">{{$elemM.E}}</h2>
		</div>
		<div class="ss-right">
			<h2>{{$elemM.C}}</h2>
		</div>
	</div>

		{{$book := index $.bookList $elemM.N}}
		{{range $i , $e := $book}}
		<div class="ss-row {{randSize}}">
			{{if $i|add|lr}}
			<div class="ss-left">
				<a href="/detail/{{$e.Id}}" class="ss-circle" style="background-image:url({{$e.Url}})">{{$e.Title}}</a>
			</div>
			<div class="ss-right">
				<h3>
					<span>{{dateformat $e.Start "2006-01-02"}} ~ {{dateformat $e.Finish "2006-01-02"}}</span>
					<a href="javascript:">{{$e.Name}}</a>
					<p>{{str2html $e.Desc}}</p>
				</h3>
			</div>
			{{else}}
			<div class="ss-left">
					<h3>
						<span>{{dateformat $e.Start "2006-01-02"}} ~ {{dateformat $e.Finish "2006-01-02"}}</span>
						<a href="javascript:">{{$e.Name}}</a>
						<p style="text-align:left">{{str2html $e.Desc}}</p>
					</h3>
				</div>
				<div class="ss-right">
					<a href="/detail/{{$e.Id}}" class="ss-circle" style="background-image:url({{$e.Url}})">{{$e.Title}}</a>
				</div>
			{{end}}
		</div>
		{{end}}

	{{end}}
	<!-- <div class="ss-row ss-large">
		<div class="ss-left">
			<h3>
				<span>November 22, 2011</span>
				<a href="javascript:">Hover and Click Trigger for Circular Elements with jQuery</a>
			</h3>
		</div>
		<div class="ss-right">
			<a href="javascript:" class="ss-circle ss-circle-2">Hover and Click Trigger for Circular Elements with jQuery</a>
		</div>
	</div>
	<div class="ss-row ss-small">
		<div class="ss-left">
			<a href="javascript:" class="ss-circle ss-circle-3">aaaaaaaa</a>
		</div>
		<div class="ss-right">
			<h3>
				<span>November 21, 2011</span>
				<a href="javascript:">解忧杂货店</a>
				<p>僻静的街道旁有一家杂货店，只要写下烦恼投进店前门卷帘门的投信口，第二天就会在店后的牛奶箱里得到回答：因男友身患绝症，年轻女孩静子在爱情与梦想间徘徊；克郎为了音乐梦想离家漂泊，却在现实中寸步难行；少年浩介面临家庭巨变，挣扎在亲情与未来的迷茫中……
					
					他们将困惑写成信投进杂货店，奇妙的事情随即不断发生。生命中的一次偶然交会，将如何演绎出截然不同的人生？</p>
			</h3>
		</div>
	</div>
	<div class="ss-row ss-medium">
		<div class="ss-left">
			<h3>
				<span>November 18, 2011</span>
				<a href="javascript:">Fullscreen Image Blur Effect with HTML5</a>
			</h3>
		</div>
		<div class="ss-right">
			<a href="javascript:" class="ss-circle ss-circle-4">Fullscreen Image Blur Effect with HTML5</a>
		</div>
	</div>
	<div class="ss-row ss-large">
		<div class="ss-left">
			<a href="javascript:" class="ss-circle ss-circle-5">Interactive Typography Effects with HTML5</a>
		</div>
		<div class="ss-right">
			<h3>
				<span>November 9, 2011</span>
				<a href="javascript:">Interactive Typography Effects with HTML5</a>
			</h3>
		</div>
	</div>
	<div class="ss-row ss-small">
		<div class="ss-left">
			<a href="javascript:" class="ss-circle ss-circle-6">Animated Buttons with CSS3</a>
		</div>
		<div class="ss-right">
			<h3>
				<span>November 7, 2011</span>
				<a href="javascript:">Animated Buttons with CSS3</a>
			</h3>
		</div>
	</div>
	<div class="ss-row ss-medium">
		<div class="ss-left">
			<h3>
				<span>November 2, 2011</span>
				<a href="javascript:">Original Hover Effects with CSS3</a>
			</h3>
		</div>
		<div class="ss-right">
			<a href="javascript:" class="ss-circle ss-circle-7">Original Hover Effects with CSS3</a>
		</div>
	</div> -->

</div>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/jquery.easing.1.3.js"></script>
<script>
$(function() {

	var $sidescroll	= (function() {
			
			// the row elements
		var $rows			= $('#ss-container > div.ss-row'),
			// we will cache the inviewport rows and the outside viewport rows
			$rowsViewport, $rowsOutViewport,
			// navigation menu links
			$links			= $('#ss-links > a'),
			// the window element
			$win			= $(window),
			// we will store the window sizes here
			winSize			= {},
			// used in the scroll setTimeout function
			anim			= false,
			// page scroll speed
			scollPageSpeed	= 2000 ,
			// page scroll easing
			scollPageEasing = 'easeInOutExpo',
			// perspective?
			hasPerspective	= false,
			
			perspective		= hasPerspective && Modernizr.csstransforms3d,
			// initialize function
			init			= function() {
				
				// get window sizes
				getWinSize();
				// initialize events
				initEvents();
				// define the inviewport selector
				defineViewport();
				// gets the elements that match the previous selector
				setViewportRows();
				// if perspective add css
				if( perspective ) {
					$rows.css({
						'-webkit-perspective'			: 600,
						'-webkit-perspective-origin'	: '50% 0%'
					});
				}
				// show the pointers for the inviewport rows
				$rowsViewport.find('a.ss-circle').addClass('ss-circle-deco');
				// set positions for each row
				placeRows();
				
			},
			// defines a selector that gathers the row elems that are initially visible.
			// the element is visible if its top is less than the window's height.
			// these elements will not be affected when scrolling the page.
			defineViewport	= function() {
			
				$.extend( $.expr[':'], {
				
					inviewport	: function ( el ) {
						if ( $(el).offset().top < winSize.height ) {
							return true;
						}
						return false;
					}
				
				});
			
			},
			// checks which rows are initially visible 
			setViewportRows	= function() {
				
				$rowsViewport 		= $rows.filter(':inviewport');
				$rowsOutViewport	= $rows.not( $rowsViewport )
				
			},
			// get window sizes
			getWinSize		= function() {
			
				winSize.width	= $win.width();
				winSize.height	= $win.height();
			
			},
			// initialize some events
			initEvents		= function() {
				
				// navigation menu links.
				// scroll to the respective section.
				$links.on( 'click.Scrolling', function( event ) {
					
					// scroll to the element that has id = menu's href
					$('html, body').stop().animate({
						scrollTop: $( $(this).attr('href') ).offset().top
					}, scollPageSpeed, scollPageEasing );
					
					return false;
				
				});
				
				$(window).on({
					// on window resize we need to redefine which rows are initially visible (this ones we will not animate).
					'resize.Scrolling' : function( event ) {
						
						// get the window sizes again
						getWinSize();
						// redefine which rows are initially visible (:inviewport)
						setViewportRows();
						// remove pointers for every row
						$rows.find('a.ss-circle').removeClass('ss-circle-deco');
						// show inviewport rows and respective pointers
						$rowsViewport.each( function() {
						
							$(this).find('div.ss-left')
								   .css({ left   : '0%' })
								   .end()
								   .find('div.ss-right')
								   .css({ right  : '0%' })
								   .end()
								   .find('a.ss-circle')
								   .addClass('ss-circle-deco');
						
						});
					
					},
					// when scrolling the page change the position of each row	
					'scroll.Scrolling' : function( event ) {
						
						// set a timeout to avoid that the 
						// placeRows function gets called on every scroll trigger
						if( anim ) return false;
						anim = true;
						setTimeout( function() {
							
							placeRows();
							anim = false;
							
						}, 10 );
					
					}
				});
			
			},
			// sets the position of the rows (left and right row elements).
			// Both of these elements will start with -50% for the left/right (not visible)
			// and this value should be 0% (final position) when the element is on the
			// center of the window.
			placeRows		= function() {
				
					// how much we scrolled so far
				var winscroll	= $win.scrollTop(),
					// the y value for the center of the screen
					winCenter	= winSize.height / 2 + winscroll;
				
				// for every row that is not inviewport
				$rowsOutViewport.each( function(i) {
					
					var $row	= $(this),
						// the left side element
						$rowL	= $row.find('div.ss-left'),
						// the right side element
						$rowR	= $row.find('div.ss-right'),
						// top value
						rowT	= $row.offset().top;
					
					// hide the row if it is under the viewport
					if( rowT > winSize.height + winscroll ) {
						
						if( perspective ) {
						
							$rowL.css({
								'-webkit-transform'	: 'translate3d(-75%, 0, 0) rotateY(-90deg) translate3d(-75%, 0, 0)',
								'opacity'			: 0
							});
							$rowR.css({
								'-webkit-transform'	: 'translate3d(75%, 0, 0) rotateY(90deg) translate3d(75%, 0, 0)',
								'opacity'			: 0
							});
						
						}
						else {
						
							$rowL.css({ left 		: '-50%' });
							$rowR.css({ right 		: '-50%' });
						
						}
						
					}
					// if not, the row should become visible (0% of left/right) as it gets closer to the center of the screen.
					else {
							
							// row's height
						var rowH	= $row.height(),
							// the value on each scrolling step will be proporcional to the distance from the center of the screen to its height
							factor 	= ( ( ( rowT + rowH / 2 ) - winCenter ) / ( winSize.height / 2 + rowH / 2 ) ),
							// value for the left / right of each side of the row.
							// 0% is the limit
							val		= Math.max( factor * 50, 0 );
							
						if( val <= 0 ) {
						
							// when 0% is reached show the pointer for that row
							if( !$row.data('pointer') ) {
							
								$row.data( 'pointer', true );
								$row.find('.ss-circle').addClass('ss-circle-deco');
							
							}
						
						}
						else {
							
							// the pointer should not be shown
							if( $row.data('pointer') ) {
								
								$row.data( 'pointer', false );
								$row.find('.ss-circle').removeClass('ss-circle-deco');
							
							}
							
						}
						
						// set calculated values
						if( perspective ) {
							
							var	t		= Math.max( factor * 75, 0 ),
								r		= Math.max( factor * 90, 0 ),
								o		= Math.min( Math.abs( factor - 1 ), 1 );
							
							$rowL.css({
								'-webkit-transform'	: 'translate3d(-' + t + '%, 0, 0) rotateY(-' + r + 'deg) translate3d(-' + t + '%, 0, 0)',
								'opacity'			: o
							});
							$rowR.css({
								'-webkit-transform'	: 'translate3d(' + t + '%, 0, 0) rotateY(' + r + 'deg) translate3d(' + t + '%, 0, 0)',
								'opacity'			: o
							});
						
						}
						else {
							
							$rowL.css({ left 	: - val + '%' });
							$rowR.css({ right 	: - val + '%' });
							
						}
						
					}	
				
				});
			
			};
		
		return { init : init };
	
	})();
	
	$sidescroll.init();
	
});
</script>
</body>
</html>

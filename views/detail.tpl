<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8" />
	<title>facebook效应 (大卫·柯克帕特里克) - 来自 Kindle 伴侣</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="/static/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="/static/css/custom.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/static/js/custom.js"></script>
</head>
<body>
	<div class="container">
		<header class="header col-md-12">
			<div class="page-header">
				<h1><small><span class="glyphicon glyphicon-book" aria-hidden="true"></span> {{.bookname}}</small> <span class="badge">{{.list | len}}</span></h1>
			</div>
		</header>

		<div class="col-md-2">
			<ul class="nav nav-pills nav-stacked">
				<li role="presentation" class="active text-center">
					<a href="/"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 返回目录</a>
				</li>
			</ul>
		</div>

		<div class="col-md-10">

			{{range $i,$c := .list}}
			<article>
				<div class="panel panel-default">
					<div class="panel-body mk{{$i}}"><p>{{$c.Content}}</p></div>
					<div class="panel-footer text-right">
						<span class="label label-primary"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span> 标注</span> 
						<span class="label label-default"><span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> {{$c.Postion}}</span> 
						<span class="label label-default"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> {{dateformat $c.MarkTime "2006-01-02 15:04:05"}} {{$c.MarkTime | t2w}}</span>
					</div>
				</div>
			</article>

			{{if $c.Comment}}
			<article>
				<div class="panel panel-default">
					<div class="panel-body nt{{$i}}"><p>{{$c.Comment}}</p></div>
					<div class="panel-footer text-right">
						<span class="label label-primary"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span> 笔记</span> 
						<span class="label label-default"><span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> {{$c.Postion}}</span> 
						<span class="label label-default"><span class="glyphicon glyphicon-time" aria-hidden="true"></span>{{dateformat $c.MarkTime "2006-01-02 15:04:05"}}</span>
					</div>
				</div>
			</article>
			{{end}}
			{{end}}
		
		</div>

		<footer class="footer col-md-12">
			<div class="text-center">
				<a href="http://moonwwdz.win" target="_blank">Moonwwdz - 旧书不厌百回读</a>
			</div>
		</footer>
	</div>
</body>
</html>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>读书列表 - 所有列表</title>
	<link href="/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="/static/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="/static/css/custom.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/static/js/custom.js"></script>
</head>

<body>
	{{if .editFlag}}
		<form class="form-horizontal" role="form" method="post" action="/list/edit/{{.book.Id}}">
	{{else}}
		<form class="form-horizontal" role="form" method="post" action="/list/add">
	{{end}}
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">书名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="" placeholder="请输入书名" name="book_name" value="{{.book.Name}}">
				</div>
			</div>
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">Title</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="" placeholder="请输入Title" name="book_title" value="{{.book.Title}}">
				</div>
			</div>

			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">简介</label>
				<div class="col-sm-10">
					<textarea name="book_desc" class="form-control" id="" placeholder="请输入简介" rows="10">{{.book.Desc}}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">书图</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="" placeholder="请输入书图" name="book_url" value="{{.book.Url}}">
				</div>
			</div>
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">进度</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="" placeholder="请输入阅读进度" name="book_process" value="{{.book.Process}}">
				</div>
			</div>
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">开始时间</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="" placeholder="请输入开始时间" name="book_start" value="{{ .book.Start }}">
				</div>
			</div>
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">结束时间</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="" placeholder="请输入结束时间" name="book_end" value="{{ .book.Finish }}">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">提交</button>
				</div>
			</div>
		</form>


</body>

</html>
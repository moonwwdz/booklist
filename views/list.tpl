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

	<table class="table table-striped">
		<caption>所有列表</caption>
		<thead>
			<tr>
				<th>名称</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			{{range .list}}
			<tr>
				<td>{{.Name}}</td>
				<td>
					<div class="btn-group btn-group-sm pull-right">
						<a href="/list/edit/{{.Id}}"><button type="button" class="btn btn-default">编辑</button></a>
					</div>
				</td>
			</tr>
			{{end}}
		</tbody>
	</table>

</body>

</html>
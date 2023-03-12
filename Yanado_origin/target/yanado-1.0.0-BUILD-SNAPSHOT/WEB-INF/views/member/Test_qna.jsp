<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script
	src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://uicdn.toast.com/tui-tree/latest/tui-tree.js"></script>
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-tree/latest/tui-tree.css" />

</head>

<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.hi</P>




	<div id="grid"></div>

	<script type="text/javascript">
		const gridData = [ {
			
			id : '10012',
			city : 'Seoul',
			country : 'South Korea'
			
		}, {
			id : '10013',
			city : 'Tokyo',
			country : 'Japan'
		}, {
			id : '10014',
			city : 'London',
			country : 'England'
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia'
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia'
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia'
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia'
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia'
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia'
		}, {
			id : '10016',
			city : 'Reykjavik',
			country : 'Iceland'
		} ];

		const grid = new tui.Grid({
			el : document.getElementById('grid'),
			data : gridData,
			  rowHeaders: ['checkbox'],
		      bodyHeight: 500,
		      treeColumnOptions: {
		        name: 'id',
		        useIcon: false,
		        useCascadingCheckbox: true
		      },
		    
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : 'id',
				name : 'id'
			}, {
				header : 'city',
				name : 'city'
			}, {
				header : 'country',
				name : 'country'
			} ],
			
		      rowHeaders: ['rowNum'],
		      pageOptions: {
		        useClient: true,
		        perPage: 5
		      }
		      
		});
		
	

	
	  
	</script>
</body>
</html>

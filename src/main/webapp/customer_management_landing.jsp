
<%@page
	import="java.util.*,java.math.*,com.crm.vo.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Custome | Management</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="static/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="static/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="static/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="static/dist/css/AdminLTE.min.css">
  
  <link rel="stylesheet" href="static/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  
  <link rel="stylesheet" href="static/dist/css/skins/_all-skins.min.css">
<%
	List<CustomerDetail> custDetailList= (List<CustomerDetail>)request.getAttribute("custDetailList") ;
%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <span class="logo-mini"><b>C</b>MAG</span>
      
      <span class="logo-lg"><b>Customer</b>M</span>
    </a>
   
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
         
          <!-- Tasks: style can be found in dropdown.less -->
         
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="static/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">Shashank Solanki</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  Shashank Solanki
                  
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="Logout" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Shashank Solanki</p>
         
        </div>
      </div>
   
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="CustomerManagement"><i class="fa fa-circle-o"></i> Customer Management</a></li>
            <li><a href="register.jsp"><i class="fa fa-circle-o"></i>Admin Registration</a></li>
          </ul>
        </li>
        </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <small>CUSTOMER MANAGEMENT DASHBOARD</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
    <section>
  <form id="crmForm" action="CustomerManagement" method="post" >  
    <div class="col-md-12">
          <!-- Application buttons -->
          <div class="box">
            <div class="box-body">
               <a class="btn btn-app" onclick= "addCustomer()">
                <i class="fa fa-plus"></i> Add
              </a>

               
              <a class="btn btn-app">
               <i class="fa fa-trash" onclick= "deleteCustomer()"></i> Delete
              </a>
             
       </div>
        
       <input type="hidden" id="action" name="action">

   
          <!-- /.box -->

            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>SELECT</th>
                  <th>CUSTOMER NUMBER</th>
                  <th>NAME</th>
                  <th>GENDER</th>
                  <th>D.O.B</th>
                  <th>RESIDENT</th>
                  <th>BIRTH PLACE</th>
                  <th>MOBILE NUMBER</th>
                  <th>SEGMENT</th>
                </tr>
                </thead>
                <tbody>
                <%if(custDetailList!=null)
                {
               for(int i=0;custDetailList.size()>i;i++) {%>
                <tr>
                  <td><input type="checkbox" name="customerId" id= "<%=custDetailList.get(i).getCustomerNumber()%>" value="<%=custDetailList.get(i).getCustomerNumber()%>"></td>
                  <td><a onclick= "getCustomerWithId('<%=custDetailList.get(i).getCustomerNumber()%>')"><%=custDetailList.get(i).getCustomerNumber() %></a></td>
                  <td><%=custDetailList.get(i).getFirstName() %> &nbsp; <%=custDetailList.get(i).getLastName()%></td>
                  <td> <%=custDetailList.get(i).getGender() %></td>
                  <td><%=custDetailList.get(i).getDateOfBirth() %></td>
                  <td> <%=custDetailList.get(i).getCountryOfResidence() %></td>
                  <td><%=custDetailList.get(i).getCountryOfBirth() %></td>
                  <td><%=custDetailList.get(i).getMobileNumber() %></td>
                  <td><%=custDetailList.get(i).getCustomerSegmant() %></td>
                </tr>
                  <%} 
               }%>
                </tbody>

              </table>
            </div>
            <!-- /.box-body -->
         
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      </form>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
    </section>

    <!-- Main content -->
    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 0.0.1
    </div>
    <strong>Copyright &copy; 2019 <a href="https://adminlte.io">ABC</a>.</strong> All rights
    reserved.
  </footer>

  <div class="control-sidebar-bg"></div>
</div>

<script src="static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="static/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- AdminLTE App -->
<script src="static/dist/js/adminlte.min.js"></script>

<script src="static/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="static/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  });
  

</script>
<script type="text/javascript">
function addCustomer(){
	window.open("addcustomer.jsp", "myWindow", 'width=500,height=700');
	window.close();
	};

function getCustomerWithId(id)
	{
	window.open("CustomerManagement?customerid="+id+"&action=getcustomerbyid", "myWindow", 'width=500,height=700');
	window.close();
	};
	
function deleteCustomer()
{

	document.getElementById("action").value = "delete";
	document.forms["crmForm"].submit();
}
</script>

</body>
</html>

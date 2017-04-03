<%@page import="entities.Medico"%>
<%!
    private boolean existSession(HttpServletRequest request){
        return request.getSession().getAttribute("user") != null;
    }

    private String getName(HttpSession session){
        Medico medico = (Medico) session.getAttribute("user");
        return medico.getNombre() + " " + medico.getApellido();
    }
%>
<%
    if (!existSession(request)) {
        request.getServletContext().getRequestDispatcher("/index.jsp?sessionError=true").forward(request, response);
    }
%>

 
        <jsp:include page="/WEB-INF/header.jsp"/>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Agenda de hoy</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Horario
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Hora</th>
                                            <th>Paciente</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>09:00</td>
                                            <td>Danielle S. Kelley</td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>09:30</td>
                                            <td>Roger A. Bruce</td>
                                        </tr>
                                        <tr class="odd gradeA">
                                            <td>10:30</td>
                                            <td>Lisa B. Marconi</td>
                                        </tr>
                                        <tr class="even gradeA">
                                            <td>11:00</td>
                                            <td>Margaret W. Moses</td>
                                        </tr>
                                        <tr class="odd gradeA">
                                            <td>11:30</td>
                                            <td>Carli J. Snyder</td>
                                        </tr>
                                        <tr class="even gradeA">
                                            <td>12:00</td>
                                            <td>Michael R. Cunningham</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>12:30</td>
                                            <td>Larry K. Burnett</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>13:00</td>
                                            <td>Larry K. Burnett</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>13:30</td>
                                            <td>Courtney M. Johnson</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>14:00</td>
                                            <td>Concepcion R. Morgan</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>14:30</td>
                                            <td>Sarah S. Martinez</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>15:00</td>
                                            <td>Andy K. Buchanan</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                                
            </div>
            <!-- /.container-fluid -->
        </div>
    </div>
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="vendor/datatables-responsive/dataTables.responsive.js"></script>
    
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    
    <script>
        $(document).ready(function() {
            $('#dataTables-example').DataTable({
                responsive: true
            });
        });
    </script>
    
    </body>
</html>

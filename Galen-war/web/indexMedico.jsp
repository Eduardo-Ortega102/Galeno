<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Panel Medico</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <jsp:include page="/WEB-INF/headerRef.html"/>
    </head>
    <body>    
        <div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
                <div id="page-wrapper">
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
        </div>
        <jsp:include page="/WEB-INF/footerRef.html"/>        
    </body>
</html>
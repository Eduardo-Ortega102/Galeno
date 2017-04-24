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
                                <h1 class="page-header">Mis Pacientes</h1>
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Pacientes
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Paciente</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="odd gradeX">
                                                    <td>Danielle S. Kelley</td>
                                                </tr>
                                                <tr class="even gradeC">
                                                    <td>Roger A. Bruce</td>
                                                </tr>
                                                <tr class="odd gradeA">
                                                    <td>Lisa B. Marconi</td>
                                                </tr>
                                                <tr class="even gradeA">
                                                    <td>Margaret W. Moses</td>
                                                </tr>
                                                <tr class="odd gradeA">
                                                    <td>Carli J. Snyder</td>
                                                </tr>
                                                <tr class="even gradeA">
                                                    <td>Michael R. Cunningham</td>
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
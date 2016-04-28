<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="text" />
<!DOCTYPE html>
<html lang="${language}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${user.name}(@${user.uniqueName}) | WebChat</title>

    <link href="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">        
    <link href="${pageContext.request.contextPath}/css/webchat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/js/jquery-1.12.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/webchat.js"></script>
</head>

<body style="background-color: #f6f6f6;">
    
            <!-- Brand and toggle get grouped for better mobile display -->            
            
            <c:if test="${sessionScope.userType == 'USER'}">
            	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin: 0px; border: none;background-color: white;border-bottom:1px double #656464;">
        		<div class="container">
            
            	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li style="height:60px;">
                        <a href="${pageContext.request.contextPath}/" class="navTab" style="padding-right:0px;padding-left:0px;padding-bottom:7px;margin-right:15px;margin-left:15px;"><span style="font-size: 14pt;height:80px;"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> <fmt:message key="nav.home"/></span></a>
                        <span class="anime" style="background-color:blue;width:100%;height:0px;"></span>
                    </li>
                    <li style="height:60px;">
                        <a href="#" class="navTab" style="padding-right:0px;padding-left:0px;padding-bottom:7px;margin-right:15px;margin-left:15px;"><span style="font-size: 14pt;"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span> Notifications</span></a>
                    	<span class="anime" style="background-color:blue;width:100%;height:0px;"></span>
                    </li>
                    <li style="height:60px;">
                        <a href="#" class="navTab" style="padding-right:0px;padding-left:0px;padding-bottom:7px;margin-right:15px;margin-left:15px;"><span style="font-size: 14pt;"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> Messages</span></a>
                    	<span class="anime" style="background-color:blue;width:100%;height:0px;"></span>
                    </li>
                </ul>
                
     			<form class="navbar-form navbar-right">
        			<button type="button" class="nav navbar-nav navbar-right btn btn-primary" aria-label="Left Align" style="color:#3366BB;" data-toggle="modal" data-target="#messageModal">
        				<span style="color: white;"><span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color:white; padding-left:5px;"></span> Write message</span>
					</button>
				</form>
    			
    			<form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post">
    			<ul class="nav navbar-nav navbar-right" role="navigation">       				 
        			<li class="dropdown">
          				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="padding:0px;margin-top:8px;margin-bottom:10px;"><img alt="Brand" src="${pageContext.request.contextPath}${user.logoURL}" class="img-rounded" style="width: 35px;height:35px;margin-right:15px;"></a>
          				         				
          				<ul class="dropdown-menu" >
            				<li><a href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.name}<br><span style="color:gray; font-size:10pt;">View profile</span></a></li>
            				<li role="separator" class="divider"></li>
            				<li><a href="#"><span style="color:gray; font-size:10pt;">Settings</span></a></li>
            				<li><a href="javascript:$('#logoutForm').submit()"><span style="color:gray; font-size:10pt;">Logout</span></a></li>
          				</ul>
          				
        			</li>
      			</ul>	
      			</form>			
                
                <form class="navbar-form navbar-right" role="search">
  					<div class="form-group" style="position: relative;">
  						<i class="glyphicon glyphicon-search" style="position: absolute; padding: 8px; right: 0px; cursor: pointer; font-size: 13pt;"></i>
    					<input type="text" class="form-control" placeholder="Search" style="border-radius:20px;">
 					</div>
				</form>
            	</div>     
            	
            	</div>
    			</nav>
            	
            	<div class="modal fade" tabindex="-1" role="dialog" id="messageModal">
  					<div class="modal-dialog">
    					<div class="modal-content">
      						<div class="modal-header">
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        						<h4 class="modal-title" style="text-align:center;">Compose new message</h4>
      						</div>
      						<div class="modal-body" style="padding-bottom:60px;background-color:#e9f5fd;">
        						<form id="messageForm2" action="${pageContext.request.contextPath}/user/addMessage" method="post">
            						<input value="${user.id}" name="userId" hidden="true"/>
            						<input value="${user.uniqueName}" name="userUniqueName" hidden="true"/>
            			
									<div style="position: relative;" id="addMessageDiv2" class="addMessageDiv">
    									<textarea name="addMessageInput" class="addMessageInput form-control" style="padding-right: 30px; overflow: hidden; resize:none; padding-top: 10px; height: 40px;" placeholder="What's happening?" maxlength="140"></textarea>
									</div>						
						
									<div class="addMessageIconsDiv" style="padding-right: 15px;">
						
						
										<div id="previewDiv" style="siplay:block;padding:15px 0px 15px 0px;" hidden="true">
											<img id="preview" src="#" alt="your image" style="border-bottom-right-radius: 5px;border-top-right-radius: 5px;border-bottom-left-radius: 5px;border-top-left-radius: 5px;"/>
										</div>
						
										<div class="col-md-1" style="text-align: center; overflow: hidden; border: none;display:block;">							
											<span class = "glyphicon glyphicon-camera" aria-hidden = "true" style="display: block; padding-right: 20px;font-size: 15pt;color: #3366BB;"></span>
											<input type="file" onchange="previewImage(this);" name="file" id="file" size="1" style="margin-top: -50px; margin-left:-410px; -moz-opacity: 0; filter: alpha(opacity=0); opacity: 0; font-size: 150px; height: 60px; cursor: pointer;">
										</div>
							
							
										<p style="color:#3366BB; font-size: 15pt;">
										<!-- <a href="#"><span class = "col-md-1 glyphicon glyphicon-camera" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a> -->
        								<a href="#"><span class = "col-md-1 glyphicon glyphicon-map-marker" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a>
        								<a href="#"><span class = "col-md-1 glyphicon glyphicon-film" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a>        					
        								<a href="#"><span class = "col-md-1 glyphicon glyphicon-list-alt" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a></p>
        					
        								<span class = "letterCounter col-md-1 col-md-offset-4" style="display: block;" aria-hidden = "true" id="letterCounter"></span>
        						        					
        								<button type="button" class="messageButton nav navbar-nav navbar-right btn btn-primary" aria-label="Left Align" style="color:#3366BB;" onclick="$('#messageForm2').submit()" disabled>
        									<span style="color: white;"><span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color:white; padding-left:5px;"></span> Write message</span>
										</button>							
									</div>
								</form>
      						</div>
    					</div><!-- /.modal-content -->
  					</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
            </c:if>
            
            <c:if test="${sessionScope.userType == 'GUEST'}">
            	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin: 0px; border: none;background-color: white;border-bottom:1px double #656464;">
        		<div class="container">
        		
            	<div class="navbar-header">
                	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    	<span class="sr-only">Toggle navigation</span>
                    	<span class="icon-bar"></span>
                    	<span class="icon-bar"></span>
                    	<span class="icon-bar"></span>
                	</button>
                	<a class="navbar-brand" href="#">WebChat</a>
            	</div>
            
            	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="navTabAnimation">
                        <a href="${pageContext.request.contextPath}/" class="navTab"><fmt:message key="nav.home"/></a>
                        <span class="anime"></span>
                    </li>
                    <li class="navTabAnimation">
                        <a href="${pageContext.request.contextPath}/about" class="navTab"><fmt:message key="nav.about"/></a>
                        <span class="anime"></span>
                    </li>
                </ul>  
                
                <!-- <ul class="nav navbar-nav navbar-right" role="navigation">       				 
        			<li class="dropdown">
          				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="nav.language"/><span class="caret"></span></a>
          				<ul class="dropdown-menu" >
            				<li><a href="?language=en">English</a></li>
            				<li><a href="?language=ru">Русский</a></li>
          				</ul>
        			</li>
      			</ul>  -->	
                
                <form class="navbar-form navbar-right" role="search">
  					<div class="form-group" style="position: relative;">
  						<i class="glyphicon glyphicon-search" style="position: absolute; padding: 8px; right: 0px; cursor: pointer; font-size: 13pt;"></i>
    					<input type="text" class="form-control" placeholder="Search" style="border-radius:20px;">
 					</div>
				</form>
            	</div>   
            	
            	</div>
    			</nav>
            </c:if>            
               
        
    
     <header style="background-color: white; border-bottom: 1px double lightgray; border-top: 1px double lightgray;">
            <div class="row">
                <div class="col-md-12">
                    <img src="${pageContext.request.contextPath}${user.headerURL}" alt="" style="width:100%; height: 400px;">
                </div>
            </div><br>                   
            
            <div class="container">    	   
        		<div class="row">
        		
        			<div class="col-md-3">
        				<div style="bottom: -70px; position: absolute; z-index: 1;">
            				<img class="img-thumbnail" style="width:75%;" src="${pageContext.request.contextPath}${user.logoURL}" alt="">
            			</div>		
        			</div>
        			
        			<div class="col-md-6">
        				<div class="row">
        					<p style="color:#3366BB;"><a href="#"><span class="col-md-2 notEditable" style="text-align: center; display: block;">Сообщения<br>${user.messagesAmount}</span></a>
        					<a href="#"><span class="col-md-2 notEditable" style="text-align: center; display: block;">Читаемые<br>${user.followingAmount}</span></a>
        					<a href="#"><span class="col-md-2 notEditable" style="text-align: center; display: block;">Читатели<br>${user.followersAmount}</span></a>
        					<a href="#"><span class="col-md-2 notEditable" style="text-align: center; display: block;">Нравится<br>${user.likesAmount}</span></a>
        					<a href="#"><span class="col-md-2 notEditable" style="text-align: center; display: block;">Списки<br></span></a></p>
        				</div>     							  
        			</div>   
        			   			
        			<c:choose>
    					<c:when test="${sessionScope.user == user.uniqueName.toLowerCase()}">
    						<div class="col-md-3" style="margin-bottom: 10px;">
        						<button id="editProfile" type="button" class="btn btn-default pull-right" aria-label="Left Align" style="color:#3366BB;" onclick="editProfile()">Edit profile</button>
        						
        						<button id="editProfileSave" type="button" class="btn btn-primary pull-right" aria-label="Left Align" style="color:white;display: none;">Save changes</button>
        						<button id="editProfileCancel" type="button" class="btn btn-default pull-right" aria-label="Left Align" style="color:#3366BB;display: none;margin-right:15px;" onclick="editProfileCancel()">Cancel</button>        						
        					</div> 
    					</c:when>    
    					<c:otherwise>
    						<div class="col-md-3" style="margin-bottom: 10px;">
        						<button type="button" class="btn btn-default pull-right" aria-label="Left Align" style="color:#3366BB;">
  									<span class="glyphicon glyphicon glyphicon-user" aria-hidden="true"></span>+ Читать
								</button>
        					</div> 
    					</c:otherwise>
					</c:choose>
        			   					
        		</div>
            </div>
    </header>

    <div class="container">    	   
        <div class="row">
            <div id="userInfo" class="col-md-3" style="padding-top: 10px;">
				<h3>
					<a style="color: black;" href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.name}</a>
				</h3>
				<h4 style="color: gray;">@
					<a style="color: gray;" href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.uniqueName}</a>
				</h4>
				<p>${user.description}</p>
				<h5>
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					${user.address}
				</h5>
				<h5>
					<span class="glyphicon glyphicon-link" aria-hidden="true"></span>
					<a href="${user.site}">${user.site}</a>
				</h5>
				<h5>
					<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
					Registration Date
				</h5>
				<h5>
					<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
					<a href="#">${user.mediaFilesAmount} фото и видео</a>
				</h5>
				<div class="row" style="padding-right: 10px; padding-left: 10px;">
					<c:forEach items="${mediaList}" var="mList">
						<div class="col-md-4" style="padding: 2px;">
							<img style="height: 80px;" class="img-responsive img-rounded"
								src="${pageContext.request.contextPath}/image/${mList.link}"
								alt="">
						</div>
					</c:forEach>
				</div>
			</div>
            
            <c:if test="${sessionScope.user == user.uniqueName.toLowerCase()}">
            	<div id="userEditInfo" class="col-md-3 well" style="padding-top: 10px;display:none;margin-top:40px;background-color:#dff0f4;border:none;">
            		<form id="userEditForm" action="${pageContext.request.contextPath}/editUser" method="POST">
            			<input value="${user.id}" name="userId" hidden="true"/>
            			<input value="${user.uniqueName}" name="userUniqueName" hidden="true"/>
            			<div class="form-group">
    						<input type="text" class="form-control" id="userEditName" name="userEditName" placeholder="Name" value="${user.name}" style="font-weight:bold;">
  						</div>
  						<p style="padding-left:10px;">@${user.uniqueName}</p>
  						<div class="form-group">
    						<input type="text" class="form-control" id="userEditDescription" name="userEditDescription" placeholder="Description" value="${user.description}">
  						</div>
  						<div class="form-group">
    						<input type="text" class="form-control" id="userEditAddress" name="userEditAddress" placeholder="Address" value="${user.address}">
  						</div>
  						<div class="form-group">
    						<input type="text" class="form-control" id="userEditSite" name="userEditSite" placeholder="Site" value="${user.site}">
  						</div>
  						<div class="from-group">
  							<button type="submit" class="btn btn-primary" style="width:100%;">Theme color</button>	
  						</div>	
            		</form>
            	</div>            	
            </c:if>
             
            <div class="col-md-6 notEditable">
            	<div class="row" style="border: 1px double lightgray; padding: 10px; margin: 10px 0px 0px 0px; border-radius: 5px 5px 0px 0px; background-color: white;">
            		<div class="col-md-3"><a href="#">Сообщения</a></div>
            		<div class="col-md-4"><a href="#">Сообщения и ответы</a></div>
            		<div class="col-md-4"><a href="#">Фото и видео</a></div>
            	</div>          	
            	            	
            	<c:forEach items="${user.messages}" var="message">
    				<div class="message" style="border: 1px double lightgray; padding: 20px; border-top:none; background-color: white;">
            			<div class="row">
            				<div class="col-md-2">
            					<img class="img-responsive img-rounded" src="${pageContext.request.contextPath}${user.logoURL}" alt="">
            				</div>
            				<div class="col-md-10">
            					<p class="messageLink" style="color: gray;"><strong><a href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.name}</a></strong> @${user.uniqueName} - pastTime</p>
            					<p>${message.text}</p>
            					
            					<c:choose>
    								<c:when test="${fn:length(message.mediaLinks) == 1}">
      									 <c:forEach items="${message.mediaLinks}" var="media">
            								<img class="img-responsive img-rounded" src="${pageContext.request.contextPath}/image/${media.link}" alt=""><br>
            							</c:forEach>
    								</c:when>    
    								<c:when test="${fn:length(message.mediaLinks) == 2}">
    									<div class="row" style="padding-right: 15px; padding-left: 15px;">
            							 	<div class="col-md-6" style="padding: 0px;">
            							 		<img class="img-responsive img-rounded" style="height: 200px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; padding-right:1px;" src="${pageContext.request.contextPath}/image/${message.mediaLinks[0].link}" alt=""><br>
            							 	</div>
            								<div class="col-md-6" style="padding: 0px;">
            									<img class="img-responsive img-rounded" style="height: 200px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px;" src="${pageContext.request.contextPath}/image/${message.mediaLinks[1].link}" alt=""><br>
            								</div>
            							</div>
    								</c:when>    
    								<c:when test="${fn:length(message.mediaLinks) == 3}">
      									 <div class="row" style="padding-right: 15px; padding-left: 15px;">
            							 	<div class="col-md-7" style="padding: 0px;">
            							 		<img class="img-responsive img-rounded" style="height: 300px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; padding-right:1px;" src="${pageContext.request.contextPath}/image/${message.mediaLinks[0].link}" alt=""><br>
            							 	</div>
            								<div class="col-md-5" style="padding: 0px;">
            									<img class="img-responsive img-rounded" style="height: 150px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px; border-bottom-right-radius: 0px; padding-bottom:1px; width:100%;" src="${pageContext.request.contextPath}/image/${message.mediaLinks[1].link}" alt="">
            									<img class="img-responsive img-rounded" style="height: 150px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px; border-top-right-radius: 0px; padding-top:1px; width:100%;" src="${pageContext.request.contextPath}/image/${message.mediaLinks[2].link}" alt=""><br>
            								</div>
            							</div>
    								</c:when>    
    								<c:when test="${fn:length(message.mediaLinks) > 3}">
      									 <div class="row" style="padding-right: 15px; padding-left: 15px;">
            							 	<div class="col-md-8" style="padding: 0px;">
            							 		<img class="img-responsive img-rounded" style="height: 300px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; padding-right:1px;" src="${pageContext.request.contextPath}/image/${message.mediaLinks[0].link}" alt=""><br>
            							 	</div>
            								<div class="col-md-4" style="padding: 0px;">
            									<img class="img-responsive img-rounded" style="height: 100px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px; border-bottom-right-radius: 0px; padding-bottom:1px; width:100%;" src="${pageContext.request.contextPath}/image/${message.mediaLinks[1].link}" alt="">
            									<img class="img-responsive" style="height: 100px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px; border-top-right-radius: 0px; padding-top:1px; padding-bottom:1px; width:100%;" src="${pageContext.request.contextPath}/image/${message.mediaLinks[2].link}" alt="">
            									<img class="img-responsive img-rounded" style="height: 100px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px; border-top-right-radius: 0px; padding-top:1px; width:100%;" src="${pageContext.request.contextPath}/image/${message.mediaLinks[2].link}" alt="">
            								</div>
            							</div>
    								</c:when>    
								</c:choose>
            					
            					
            					<div class="row">
            						<div class="col-md-2 messageIcons"><a href="#"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span></a></div>            						
            						<div class="col-md-2 messageIcons retweet"><a href="#"><span class="glyphicon glyphicon-retweet" aria-hidden="true"> <strong>${message.retweets}</strong></span></a></div>
            						<div class="col-md-2 messageIcons like"><a href="#"><span class="glyphicon glyphicon-heart" aria-hidden="true"> <strong>${message.likes}</strong></span></a></div>
            						<div class="col-md-6 messageIcons"><a href="#"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span></a></div>
            				    </div>
            				</div>
            			</div>    
            		</div>
            	</c:forEach>               	
            </div>

            <div class="col-md-3" style="margin: 10px 0px 0px 0px;">
				
				<c:if test="${sessionScope.userType == 'GUEST'}">
					<div class="well">
                    	<h4>Не пользуетесь WebChat?</h4>
                    	<p>Зарегистрируйтесь и получите свою собственную персонализированную ленту!</p>
                    	<button type="button" class="btn btn-primary" onclick="location = '${pageContext.request.contextPath}/'">Регистрация</button>
               		</div>
				</c:if>          	              

                <div class="well notEditable" style="background-color:white;">
                    <h4>Вам также может понравиться</h4>
                    <a href="#">Обновить</a>
                    
                    <c:forEach items="${followingUsers}" var="following" begin="0" end="5">
                    	
                    	<p class="messageLink"><a href="${pageContext.request.contextPath}/user/${following.uniqueName}">
                    		<span class="row" style="cursor: pointer; display: block;" onclick="window.location='#';">
            					<span class="col-md-4">
            						<img style="height:50px; width:100%;" class="img-responsive img-rounded" src="${pageContext.request.contextPath}${following.logoURL}" alt="">
            					</span>
            					<span class="col-md-8" style="padding-left:0px;">            				
            						<Strong>${following.name}</Strong><br>@${following.uniqueName}
            					</span>
                    		</span><br>
                    	</a></p>

            		</c:forEach>                 
                    
                </div>

                <div class="well notEditable" style="background-color:white;">
                    <h4>Актуальные темы</h4>
                    <a href="#">#sampleTag</a><br>
                    <a href="#">sampleLink</a><br>
                    <a href="#">#sampleTag</a><br>
                    <a href="#">sampleLink</a><br>
                    <a href="#">#sampleTag</a><br>
                    <a href="#">sampleLink</a><br>
                </div>
                
                <p class="notEditable">Copyright &copy; WebChat 2016</p>
            </div>
        </div>
    </div>
</body>

</html>
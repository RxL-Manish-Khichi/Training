<!doctype html>
<html lang="en">
<head>
    <asset:stylesheet src= "link.css"></asset:stylesheet>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="link.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
    #fif {
        width: 100px;
        height: 100px;
    }
    </style>
    <title>Link Sharing</title>
</head>
<body id="b11">
<h3 style="background-color:green;text-align:center">${flash.success}</h1>
<h3 style="background-color:red;text-align:center">${flash.error}</h3>
<h3 style="background-color:green;text-align:center">${flash.msg1}</h3>
<h3 style="background-color:#F5F5F5;text-align:center">${flash.msg2}</h3>
<h3 style="background-color:red;text-align:center">${flash.msg3}</h3>
    <h3 style="background-color:red;text-align:center">${flash.msg4}</h3>

<!--<div class="row g-2">
    <h1 id="hm1">Homepage</h1>
</div>-->
<div class="container-fluid">
<div class="row g-2">
    <nav class="navbar navbar-light bg-light" id="navii">
        <div class="container-fluid">
            <a class="navbar-brand" href="https://www.google.co.in/">Link Sharing</a>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </nav>



</div>
</div>

<div class="row g-3">
    <div class="col-md-6">
        <div class="card"id="cardch">
            <h5 class="card-header">Recent shares</h5>
            <g:each in="${rsc}" var="it">
                <g:if test="${it.hasProperty("filePath")}">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-auto">
                                <figure class="figure">
                                    <asset:image src="${it.createdBy.photo}" id="fif"></asset:image>

                                </figure>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <h5 class="card-title">${it.createdBy.firstname} ${it.createdBy.lastname} <h6
                                                class="card-subtitle mb-2 text-muted">@${it.createdBy.username}
                                            -updated ${it.lastUpdated}</h6>
                                        </h5>
                                    </div>
                                    <div class="col">
                                        <div class="mb-3">
                                            <h5 class="card-title"><g:link controller="topic" action="viewTopic" params="[id:it.topic.id]" class="card-link">${it.topic.topicname}</g:link></h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"><p class="card-text">${it.description}</p></div>


                                <div class="row">
                                    <div class="col">

                                        <a href="https://www.facebook.com/"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                 fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                            <path
                                                    d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                                        </svg></a>
                                        <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
                                            <path
                                                    d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
                                        </svg></a>
                                        <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                            <path
                                                    d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                        </svg></a>


                                    </div>

                                    <div class="col-auto">
                                        <div class="mb-3">
                                            <g:link controller="resource" action="documentFile" params="[id:it.id]" class="link-primary">Download</g:link>
                                        </div>
                                    </div>


                                    <!--    <div class="col-auto">
                                    <div class="mb-3">
                                        <a href="#" class="link-primary">View Full Site</a>
                                    </div>
                                </div>-->
                                    <div class="col-auto">
                                        <div class="mb-3">
                                            <a href="#" class="link-primary">Mark as read</a>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <div class="mb-3">
                                            <a href="/user/frontviewpost" data-bs-toggle="tooltip" data-bs-placement="top"
                                               title="First Login"class="link-primary">View Post</a>
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>

                </g:if>
                <g:else>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-auto">
                                <figure class="figure">
                                    <asset:image src="${it.createdBy.photo}" id="fif"></asset:image>

                                </figure>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <h5 class="card-title">${it.createdBy.firstname} ${it.createdBy.lastname} <h6
                                                class="card-subtitle mb-2 text-muted">@${it.createdBy.username}
                                            -updated ${it.lastUpdated}</h6>
                                        </h5>
                                    </div>
                                    <div class="col">
                                        <div class="mb-3">
                                            <h5 class="card-title"><g:link controller="topic" action="viewTopic" params="[id:it.topic.id]" class="card-link">${it.topic.topicname}</g:link></h5>
                                        </div>
                                    </div>
                                </div>
                                <p class="card-text">${it.description}</p>

                                <div class="row">
                                    <div class="col">

                                        <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                            <path
                                                    d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                                        </svg></a>
                                        <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
                                            <path
                                                    d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
                                        </svg></a>
                                        <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                            <path
                                                    d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                        </svg></a>


                                    </div>
                                    <!--      <div class="col-auto">
                                            <div class="mb-3">
                                                <a href="#" class="link-primary">Download</a>
                                            </div>
                                        </div>-->
                                    <div class="col-auto">
                                        <div class="mb-3">
                                            <a href="${it.url}" class="link-primary">View Full Site</a>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <div class="mb-3">
                                            <a href="#" class="link-primary">Mark as read</a>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <div class="mb-3">
                                            <a href="/user/frontviewpost" class="link-primary" data-bs-toggle="tooltip" data-bs-placement="top"
                                               title="First Login">View Post</a>
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </g:else>
                <div class="divider"></div>

            </g:each>

        </div>
        <div class="card" id="card3">
            <div class="card-header">
                <div class="row">
                    <div class="col">
                        <h5>Top posts</h5>
                    </div>
                    <div class="col-auto">
                        <div class="container">
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Select Time
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Today</a>
                                    <a class="dropdown-item" href="#">1 week</a>
                                    <a class="dropdown-item" href="#">1 Month</a>
                                    <a class="dropdown-item" href="#">1 Year</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>



            </div>
            <g:each in="${rlist}" var="it">

            <div class="card-body">
                <div class="row">
                    <div class="col-auto">
                        <figure class="figure">
                           <asset:image src="${it.createdBy.photo}" id="fif"></asset:image>
                        </figure>
                    </div>
                    <div class="col">
                        <h5 class="card-title">${it.createdBy.firstname} ${it.createdBy.lastname}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">@${it.createdBy.username}</h6>

                        <p class="card-text">${it.description}</p>
                        <div class="row">
                            <div class="col">
                                <div class="mb-3">
                                    <a href="https://www.facebook.com/" class="fa fa-facebook"></a>
                                    <a href="https://twitter.com/" class="fa fa-twitter"></a>
                                    <a href="https://accounts.google.com/signin/identifier?flowName=GlifWebSignIn&flowEntry=ServiceLogin" class="fa fa-google"></a>
                                </div>

                            </div>
                            <div class="col-auto">

                                <a href="/user/frontviewpost" class="link-primary" data-bs-toggle="tooltip" data-bs-placement="top"
                                   title="First Login">View Post</a>

                            </div>

                        </div>



                    </div>

                </div>

            </div>
                <div class="divider"></div>

            </g:each>


        </div>

    </div>
    <div class="col-md-6">
        <div class="card" id="l2">
            <h5 class="card-header">Login</h5>
            <div class="card-body">
                <form action="/user/loger" method="post">
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label" aria-required="true">Email address *</label>
                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label"Required>Password *</label>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword1" required>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <a href="#" class="link-primary" data-bs-toggle="modal" data-bs-target="#fpModal">Forgot Password?</a>
                            </div>
                        </div>

                        <div class="col">
                            <button type="submit" class="btn btn-primary" id="l1">Login</button>
                        </div>


                    </div>


                </form>

                <div class="modal fade" id="fpModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Forgot Password</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <g:form controller="user" action="forgotPassword" method="post">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label" aria-required="true">Email address *</label>
                                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="formGroupExampleInput" class="form-label">Answer of Security Question * </label>
                                        <input type="text" name="securityQuestion" class="form-control" id="formGroupExampleInput" placeholder="" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">New Password *</label>
                                        <input type="password" name="password" class="form-control" id="exampleInputPassword1" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Confirm New Password *</label>
                                        <input type="password" name="confirmpassword" class="form-control" id="exampleInputPassword1" required>
                                    </div>
                                    <div>
                                    <button type="submit" class="btn btn-primary">Change Password</button>
                                    </div>
                                </g:form>


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="card" id="l3">
            <h5 class="card-header">Register</h5>
            <div class="card-body">
                <form action="/user/ruser" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="formGroupExampleInput" class="form-label">First name *</label>
                        <input type="text" name="firstname" class="form-control" id="formGroupExampleInput" placeholder="" required>
                    </div>
                    <div class="mb-3">
                        <label for="formGroupExampleInput" class="form-label">Last name *</label>
                        <input type="text" name="lastname" class="form-control" id="formGroupExampleInput" placeholder="" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Email address *</label>
                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">@</span>
                        </div>
                        <input type="text" name="username"class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Password *</label>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword1" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Confirm Password *</label>
                        <input type="password" name="confirmpassword" class="form-control" id="exampleInputPassword1" required>
                    </div>


                    <div class="mb-3">
                        <label for="formFileSm" class="form-label">Photo</label>
                        <input class="form-control form-control-sm" name="image" id="formFileSm" type="file" accept="image/*">
                    </div>
                    <div class="mb-3">
                        <label for="formGroupExampleInput" class="form-label">Security Question *- Whats Your First School Name?</label>
                        <input type="text" name="securityQuestion" class="form-control" id="formGroupExampleInput" placeholder="" required>
                    </div>
                    <button type="submit" name="register" class="btn btn-primary" id="l1">Register</button>
                </form>
            </div>
        </div>


    </div>
    <div class="row-gt-2"></div>
</div>


<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="link.js></script>"></script>
    <script>
        var myModal = document.getElementById('myModal')
        var myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', function () {
            myInput.focus()
        })
    </script>


  </body>
</html>
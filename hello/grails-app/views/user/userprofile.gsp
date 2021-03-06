<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="dash.css" rel="stylesheet">
    <title>User Profile Link sharing app</title>
    <style>
    #fif {
        width: 2cm;
        height: 2cm;
    }

    .divider {
        margin-top: 1rem;
        margin-bottom: 1rem;
        border: 0;
        border-top: 1px solid rgba(0, 0, 0, 0.1);
    }
    body{
        background-color: tomato;
    }
    </style>
</head>

<body>
<h1>User Profile</h1>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Link Sharing</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-award" viewBox="0 0 16 16">
                            <path
                                    d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702 1.509.229z" />
                            <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z" />
                        </svg>
                    </li>


                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">${session.user.firstname}
                           </a>
                    </a>
                        <g:if test="${session.user.admin}">

                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/user/editprof">Profile</a></li>
                                <li><a class="dropdown-item" href="/user/userlist">Users</a></li>
                                <li><a class="dropdown-item" href="/user/toplist">Topics</a></li>
                                <li><g:link controller="user" action="postlist" class="dropdown-item">Posts</g:link></li>
                                <li><a class="dropdown-item" href="/user/logout">Logout</a></li>


                            </ul>
                        </g:if>
                        <g:else>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/user/editprof">Profile</a></li>

                                <li><a class="dropdown-item" href="/user/logout">Logout</a></li>


                            </ul>
                        </g:else>
                    </li>

                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>


<div class="container-fluid">
    <div class="row g-3">
        <div class="col-md-6">
            <div class="row mt-2"> </div>
            <div class="row mt-2"> </div>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-auto">
                            <figure class="figure">
                                <asset:image src="${user.photo}" id="fif"/>
                            </figure>
                        </div>
                        <div class="col">
                            <div class="row">
                                <h5 class="card-title">${user.firstname} ${user.lastname}</h5>
                                <h6 class="card-subtitle mb-2 text-muted">@${user.username}</h6>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <h9>Subscriptions</h9>
                                    <a href="#" class="card-link">${user.subscriptions.size()}</a>
                                </div>
                                <div class="col">
                                    <h9>Topics </h9>
                                    <a href="#" class="card-link">${user.topics.size()}</a>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>

            <div class="row mt-2"> </div>
            <div class="row mt-2"> </div>

            <div class="card" id="cardd">
                <div class="card-header">
                    Topics
                </div>
                <g:each in="${topiclist}" var="${it}">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <a href="#" class="link-primary">${it.topicname}</a>
                        </div>
                        <div class="col">
                            Subscriptions

                        </div>
                        <div class="col">
                            Posts

                        </div>

                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    %{--<select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                        <option selected>select</option>
                                        <option value="1">Serious</option>
                                        <option value="2">Very Serious</option>
                                        <option value="3">Casual</option>
                                    </select>--}%
                                </div>

                                <div class="col">
                                    %{--<a class="nav-link" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                      height="16" fill="currentColor" class="bi bi-envelope"
                                                                      viewBox="0 0 16 16">
                                        <path
                                                d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z" />
                                    </svg></a>--}%


                                </div>






                            </div>

                        </div>
                        <div class="col">
                            <a href="#" class="link-primary">${it.subscribers.size()}</a>
                        </div>
                        <div class="col">
                            <a href="#" class="link-primary">${it.resources.size()}</a>
                        </div>

                    </div>
                </div>
                <div class="divider"></div>
                </g:each>

            </div>



            <div class="row mt-2"> </div>
            <div class="row mt-2"> </div>

            <div class="card" id="cardd">
                <div class="card-header">
                    Subscription
                </div>
                <g:each in="${sublist}" var="it">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <a href="#" class="link-primary">${it.topic.topicname}</a>
                        </div>
                        <div class="col">
                            Subscriptions

                        </div>
                        <div class="col">
                            Post

                        </div>

                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    %{--<select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                        <option selected>select</option>
                                        <option value="1">Serious</option>
                                        <option value="2">Very Serious</option>
                                        <option value="3">Casual</option>
                                    </select>--}%
                                </div>

                                <div class="col">
                                    %{--<a class="nav-link" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                      height="16" fill="currentColor" class="bi bi-envelope"
                                                                      viewBox="0 0 16 16">
                                        <path
                                                d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z" />
                                    </svg></a>--}%


                                </div>






                            </div>

                        </div>
                        <div class="col">
                            <a href="#" class="link-primary">${it.topic.subscribers.size()}</a>
                        </div>
                        <div class="col">
                            <a href="#" class="link-primary">${it.topic.resources.size()}</a>
                        </div>

                    </div>
                </div>
                <div class="divider"></div>
                </g:each>

            </div>





        </div>
        <div class="col-md-6">
            <div class="row mt-2"> </div>
            <div class="row mt-2"> </div>

            <div class="card" id="cardd">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h5>Posts</h5>
                        </div>
                        <div class="col">
                            <div class="container">
                                %{--<div class="input-group">
                                    <input type="search" class="form-control rounded" placeholder="Search"
                                           aria-label="Search" aria-describedby="search-addon" />
                                    <button type="button" class="btn btn-outline-primary">search</button>
                                </div>--}%
                            </div>
                        </div>

                    </div>
                </div>
                <g:each in="${rlist}" var="it">
                <div class="card-body">
                    <div class="row">
                        <div class="mb-3">
                            <a href="#" class="link-primary">${it.topic.topicname}</a>
                        </div>
                        <div class="col">

                            <p class="card-text">${it.description}
                            </p>
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
                                <g:if test="${it.hasProperty("filePath")}">

                                    <div class="col-auto">
                                        <div class="mb-3">
                                            <g:link controller="resource" action="documentFile" params="[id:it.id]" class="link-primary">Download</g:link>
                                        </div>
                                    </div>
                                </g:if>


                                <g:else>
                                    <div class="col-auto">
                                        <div class="mb-3">
                                            <a href="${it.url}" class="link-primary">View Full Site</a>
                                        </div>
                                    </div>
                                </g:else>
                                <div class="col-auto">
                                    %{--<div class="mb-3">
                                        <a href="#" class="link-primary">Mark as read</a>
                                    </div>--}%
                                </div>
                                <div class="col-auto">
                                    <div class="mb-3">
                                        <g:link controller="resourcerating" action="index" params="[id: it.id]"  class="link-primary">View Post</g:link>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>
                <div class="divider"></div>
                </g:each>

            </div>

        </div>
        <div class="row-mt-2"></div>

    </div>
</div>






<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    var myModal = document.getElementById('myModal')
    var myInput = document.getElementById('myInput')

    myModal.addEventListener('shown.bs.modal', function () {
        myInput.focus()
    })
</script>
<script>
    var myModal = document.getElementById('myModal')
    var myInput = document.getElementById('myInput')

    myModal.addEventListener('shown.bs.modal', function () {
        myInput.focus()
    })
</script>
<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
</script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>

</html>
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
    <title>Search Link sharing app</title>
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
        background-color: rgb(1, 0, 7);
    }


    </style>
</head>

<body>

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
                        <a class="nav-link" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                          fill="currentColor" class="bi bi-tag" viewBox="0 0 16 16">
                            <path
                                    d="M6 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-1 0a.5.5 0 1 0-1 0 .5.5 0 0 0 1 0z" />
                            <path
                                    d="M2 1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 1 6.586V2a1 1 0 0 1 1-1zm0 5.586 7 7L13.586 9l-7-7H2v4.586z" />
                        </svg></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                          fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path
                                    d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                        </svg></a>
                    </li>
                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-award" viewBox="0 0 16 16">
                                <path
                                        d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702 1.509.229z" />
                                <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z" />
                            </svg></a>
                    </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Profile</a></li>

                            <li><a class="dropdown-item" href="/user/logout">Logout</a></li>

                        </ul>
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

            <div class="card" id="cardd">
                <div class="card-header">
                    <h3>   Trending Topics </h3>
                </div>
                <g:each in="${trending}" var="it">
                    <g:if test="${it.createdBy.username.equals(session.user.username)}">

                        <div class="card-body">
                            <div class="row">
                                <div class="col-auto">
                                    <figure class="figure" >
                                        <asset:image src="${it.createdBy.photo}" id="fif"/>

                                    </figure>

                                </div>
                                <div class="col">
                                    <div class="row">
                                        <h5 class="card-title"><a href="#" class="card-link">${it.topicname}</a></h5>
                                    </div>
                                    <div class="row">
                                        <h5 class="card-title">
                                            <div class="row">
                                                <div class="col-auto">
                                                    <input class="form-control" type="text" placeholder="Default input">
                                                </div>
                                                <div class="col-auto">
                                                    <button type="button" class="btn btn-primary">Save</button>
                                                </div>
                                                <div class="col-auto">
                                                    <button type="button" class="btn btn-primary">Cancel</button>
                                                </div>
                                            </div>

                                        </h5>

                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <h9 class="text-muted">@${it.createdBy.username}</h9>


                                        </div>
                                        <div class="col">


                                            <h9 class="text-muted">Subscriptions</h9>
                                            <a href="#" class="card-link">${it.subscribers.size()}</a>

                                        </div>

                                        <div class="col">
                                            <h9 class="text-muted">Posts</h9>
                                            <a href="#" class="card-link">${it.resources.size()}</a>

                                        </div>



                                    </div>


                                </div>

                            </div>
                            <div class="row">
                                <div class="col">
                                    <g:form controller="subscription" action="changeSeriousness">
                                        <g:field type="hidden" name="id" value="${it.id}"></g:field>
                                        <g:select  onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                   value="${hello.Subscription.findByUserAndTopic(session.user,it).seriousness}"></g:select>
                                    </g:form>
                                </div>
                                <div class="col">
                                    <g:form controller="subscription" action="changeVisibility">
                                        <g:field type="hidden" name="id1" value="${it.id}"></g:field>
                                        <g:select  onChange="submit()" name="visibility" from="${['PUBLIC','PRIVATE']}"
                                                   value="${it.visibility}"></g:select>
                                    </g:form>
                                </div>
                                <div class="col-auto">
                                    <a class="nav-link" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                      height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                                        <path
                                                d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z" />
                                    </svg></a>


                                </div>
                                <div class="col-auto">
                                    <a class="nav-link" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                      height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                        <path
                                                d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                        <path
                                                d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                    </svg></a>


                                </div>
                                <div class="col">
                                    <g:link controller="topic" action="deleteTopic" params="[id:it.id]" class="nav-link" ><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                                                                               height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                        <path
                                                d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                        <path fill-rule="evenodd"
                                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                    </svg></g:link>


                                </div>




                            </div>


                        </div>
                        <div class="divider"></div>



                    </g:if>

                    <g:else>

                        <div class="card-body">

                            <div class="row">
                                <div class="col-auto">
                                    <figure class="figure">
                                        <asset:image src="${it.createdBy.photo}" id="fif"/>
                                    </figure>
                                </div>
                                <div class="col-auto">
                                    <div class="row">
                                        <h5 class="card-title"><a href="#" class="card-link">${it.topicname}</a></h5>

                                    </div>

                                    <div class="row">
                                        <div class="col-auto">
                                            <h9 class="text-muted">@${it.createdBy.username}</h9>
                                            <g:if test="${it.subscribers.user.email.contains(session.user.email)}">
                                                <g:link controller="Subscription" action="unsubtrend" params="[id:it.id]" class="card-link" >Unsubscribed</g:link>
                                            </g:if>
                                            <g:else>
                                                <g:link controller="Subscription" action="subscribe" params="[id:it.id]" class="card-link" >Subscribed</g:link>

                                            </g:else>


                                        </div>

                                        <div class="col-auto">


                                            <h9 class="text-muted">Subscriptions</h9>
                                            <a href="#" class="card-link">${it.subscribers.size()}</a>

                                        </div>

                                        <div class="col">
                                            <h9 class="text-muted">Posts</h9>
                                            <a href="#" class="card-link">${it.resources.size()}</a>

                                        </div>



                                    </div>


                                </div>

                            </div>
                            <div class="row">
                                <div class="col-auto">

                                </div>

                                <div class="col-auto">



                                </div>
                                <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Send Invitation</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form>
                                                    <div class="mb-3">
                                                        <label for="exampleInputEmail1" class="form-label">Email
                                                        address *</label>
                                                        <input type="email" class="form-control" id="exampleInputEmail1"
                                                               aria-describedby="emailHelp">

                                                    </div>
                                                    <div class="mb-3">
                                                        <div class="input-group mb-3">
                                                            <div class="input-group-prepend">
                                                                <label class="input-group-text"
                                                                       for="inputGroupSelect01">Topic *</label>
                                                            </div>
                                                            <select class="custom-select" id="inputGroupSelect01">
                                                                <option selected>Topic</option>
                                                                <option value="1">One</option>
                                                                <option value="2">Two</option>
                                                                <option value="3">Three</option>
                                                            </select>
                                                        </div>


                                                    </div>

                                                </form>


                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Cancel</button>
                                                <button type="button" class="btn btn-primary">Invite</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>





                                <div class="divider"></div>

                            </div>


                        </div>
                    </g:else>




                </g:each>






            </div>



            <div class="row mt-2"> </div>
            <div class="row mt-2"> </div>

            <div class="card" id="card3">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h3>Top posts</h3>
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

                                        <a href="#" class="link-primary">View post</a>

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
            <div class="row mt-2"> </div>
            <div class="row mt-2"> </div>

            <div class="card" id="cardd">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h3>Search For "${word}"</h3>
                        </div>
                        <div class="col-auto">
                            <div class="container">
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button"
                                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                        Search
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
                        <!--  "-->
                    </div>
                </div>
                <g:each in="${hello.Topic.findAllByTopicnameLike("%${word}%")}" var="it">
                    <g:each in="${hello.Resource.findAllByTopic(it)}" var="rsc">
                        <g:if test="${it.visibility.equals(Enums.VisibilityEnum.PUBLIC)}">

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-auto">
                                        <figure class="figure">
                                            <asset:image src="${rsc.createdBy.photo}" id="fif"></asset:image>

                                        </figure>
                                    </div>
                                    <div class="col">
                                        <div class="row">
                                            <div class="col">
                                                <h5 class="card-title">${rsc.createdBy.firstname} ${rsc.createdBy.lastname} <h6
                                                        class="card-subtitle mb-2 text-muted">@${rsc.createdBy.username}
                                                    -updated ${rsc.lastUpdated}</h6>
                                                </h5>
                                            </div>
                                            <div class="col">
                                                <div class="mb-3">
                                                    <a href="#" class="link-primary"><h5>${rsc.topic.topicname}</h5></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row"><p class="card-text">${rsc.description}</p></div>


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
                                            %{--<g:if test="${rsc.hasProperty("filePath")}">
                                                <div class="col-auto">
                                                    <div class="mb-3">
                                                        <g:link controller="resource" action="documentFile" params="[id:rsc.id]" class="link-primary">Download</g:link>
                                                    </div>
                                                </div>
                                            </g:if>
                                            <g:else>
                                                <div class="col-auto">
                                                    <div class="mb-3">
                                                        <a href="${rsc.url}" target="_blank" class="link-primary">Open Link</a>
                                                    </div>
                                                </div>
                                            </g:else>--}%
                                            <div class="col-auto">
                                                <div class="mb-3">
                                                    <g:link controller="markread" action="markAsRead" params="[id: rsc.id]" class="link-primary">Mark as read</g:link>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <div class="mb-3">
                                                    <g:link controller="resourcerating" action="index" params="[id: rsc.id]"  class="link-primary">View Post</g:link>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </div>


                            <div class="divider"></div>

                        </g:if>
                    </g:each>
                </g:each>


            <!--   <div class="card-body">
                    <div class="row">
                        <div class="col-auto">
                            <figure class="figure" id="fif">
                                <img src="https://www.searchpng.com/wp-content/uploads/2019/02/User-Icon-PNG.png"
                                     id="pi1" class="figure-img img-fluid rounded" alt="...">
                            </figure>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <h5 class="card-title">Uday Pratap singh <h6
                                            class="card-subtitle mb-2 text-muted">@Uday
                                        5min</h6>
                                    </h5>
                                </div>
                                <div class="col">
                                    <div class="mb-3">
                                        <a href="#" class="link-primary">Grails</a>
                                    </div>
                                </div>
                            </div>
                            <p class="card-text">With supporting text below as a natural lead-in to additional
                            content.
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
                                <div class="col-auto">
                                    <div class="mb-3">
                                        <a href="#" class="link-primary">Download</a>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <div class="mb-3">
                                        <a href="#" class="link-primary">View Full Site</a>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <div class="mb-3">
                                        <a href="#" class="link-primary">Mark as read</a>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <div class="mb-3">
                                        <a href="#" class="link-primary">View Post</a>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>

                </div> -->
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
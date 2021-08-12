<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
     <asset:javascript src="rating.js"></asset:javascript>
    <script>var rateurl = "${createLink(controller:"resourcerating",action:"rate")}"</script>
    <style>
    .rating-star {
        direction: rtl;
        font-size: 40px;
        unicode-bidi: bidi-override;
        display: inline-block;
    }
    .rating-star input {
        opacity: 0;
        position: relative;
        left: -30px;
        z-index: 2;
        cursor: pointer;
    }
    .rating-star span.star:before {
        color: #777777;
    }
    .rating-star span.star {
        display: inline-block;
        font-family: FontAwesome;
        font-style: normal;
        font-weight: normal;
        position: relative;
        z-index: 1;
    }
    .rating-star span {
        margin-left: -30px;
    }
    .rating-star span.star:before {
        color: #777777;
        content:"\f006";
    }
    .rating-star input:hover + span.star:before, .rating-star input:hover + span.star ~ span.star:before, .rating-star input:checked + span.star:before, .rating-star input:checked + span.star ~ span.star:before {
        color: #ffd100;
        content:"\f005";
    }

    .selected-rating{
        color: #ffd100;
        font-weight: bold;
        font-size: 42px;
    }
    </style>

    <title>Post Link sharing app</title>
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

    div.stars {
        width: 270px;
        display: inline-block
    }

    .mt-200 {
        margin-top: 200px
    }

    input.star {
        display: none
    }

    label.star {
        float: right;
        padding: 10px;
        font-size: 36px;
        color: #4A148C;
        transition: all .2s
    }

    input.star:checked~label.star:before {
        content: '\f005';
        color: #FD4;
        transition: all .25s
    }

    input.star-5:checked~label.star:before {
        color: #FE7;
        text-shadow: 0 0 20px #952
    }

    input.star-1:checked~label.star:before {
        color: #F62
    }

    label.star:hover {
        transform: rotate(-15deg) scale(1.3)
    }

    label.star:before {
        content: '\f006';
        font-family: FontAwesome
    }

    body {
        background-color: peru;
    }
    </style>
</head>

<body>
<h1>Post</h1>
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
                            <figure class="figure" >
                                <asset:image src="${resource.createdBy.photo}" id="fif"></asset:image>
                            </figure>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <h5 class="card-title">${resource.createdBy.firstname} ${resource.createdBy.lastname} <h6
                                            class="card-subtitle mb-2 text-muted">@${resource.createdBy.username}
                                        5min</h6>
                                    </h5>
                                </div>
                                <div class="col">
                                    <div class="mb-3">
                                        <a href="#" class="link-primary">${resource.topic.topicname}</a>
                                    </div>
                                </div>
                            </div>
                            <p class="card-text">

                            <div class="main">
                                <form id="rating-form">
                                    <span class="rating-star">
                                        <input type="radio" onclick="rate(${resource.id},5)" name="rating" value="5"><span class="star"></span>

                                        <input type="radio" onclick="rate(${resource.id},4)" name="rating" value="4"><span class="star"></span>

                                        <input type="radio" onclick="rate(${resource.id},3)" name="rating" value="3"><span class="star"></span>

                                        <input type="radio" onclick="rate(${resource.id},2)" name="rating" value="2"><span class="star"></span>

                                        <input type="radio" onclick="rate(${resource.id},1)" name="rating" value="1"><span class="star"></span>
                                    </span>
                                    <span>Rated By :${resource.resourceRated.size()}</span>
                                </form>

                            </div>

                            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                            <script src="function.js" type="text/javascript"></script>
                            <!-- rating.js file -->
                            <script src="js/addons/rating.js"></script>

                        </p>
                        </div>
                    </div>

                    <div class="row">
                        <p>${resource.description}</p>

                    </div>



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
                                <g:link controller="resource" action="deleteResource" params="[id:resource.id]" onclick="return confirm('Are you sure you want to delete this Resource Item')" class="link-primary">Delete</g:link>
                            </div>
                        </div>
                        <div class="col-auto">
                            <div class="mb-3">
                         <g:if test="${resource.hasProperty("filePath")}">
                             <a href="#" class="link-primary" data-bs-toggle="modal" data-bs-target="#exampleModal6">Edit</a>
                             <div class="modal fade" id="exampleModal6" tabindex="-1" aria-labelledby="exampleModalLabel"
                                  aria-hidden="true">
                                 <div class="modal-dialog">
                                     <div class="modal-content">
                                         <div class="modal-header">
                                             <h5 class="modal-title" id="exampleModalLabel">Share Document</h5>
                                             <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                     aria-label="Close"></button>
                                         </div>
                                         <div class="modal-body">
                                             <g:uploadForm controller="resource" action="editDocument" params="[id:resource.id]" method="post" enctype="multipart/form-data">

                                                 <div class="form-group mb-3">
                                                     <label for="exampleFormControlFile1">Document *</label>
                                                     <input type="file" name="document" class="form-control-file" id="exampleFormControlFile1">
                                                 </div>

                                                 <div class="input-group mb-3">
                                                     <span class="input-group-text">Description *</span>
                                                     <textarea class="form-control" name="description" aria-label="With textarea">${resource.description}</textarea>
                                                 </div>
                                                 <div class="mb-3">
                                                     <div class="input-group mb-3">
                                                         <div class="input-group-prepend">
                                                             <label class="input-group-text"
                                                                    for="inputGroupSelect01">Topic *</label>
                                                         </div>

                                                         <label class="custom-select" name="topicname" id="inputGroupSelect01"><div><span>${resource.topic.topicname}</div></span>
                                                             <!--  <option >Topic 1</option>
                                                               <option>Topic 2</option>
                                                                <option value="1">PUBLIC</option> -->

                                                         </label>


                                                     </div>


                                                 </div>
                                                 <div class="mb-3">
                                                     <button type="submit" class="btn btn-primary" id="l1">Update</button>
                                                 </div>



                                             </g:uploadForm>


                                         </div>
                                         <div class="modal-footer">
                                             <button type="button" class="btn btn-secondary"
                                                     data-bs-dismiss="modal">Cancel</button>
                                             <!--  <button type="button" class="btn btn-primary" >Save</button>-->
                                         </div>
                                     </div>
                                 </div>
                             </div>


                         </g:if>
                                <g:else>
                                    <a href="#" class="link-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3">Edit</a>
                                    <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Share Link</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <g:uploadForm controller="resource" action="editLink" params="[id:resource.id]">
                                                        <div class="input-group mb-3">
                                                            <span class="input-group-text" id="basic-addon3">Link *</span>
                                                            <input type="link" name="link" value="${resource.url}"class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                                        </div>
                                                        <div class="input-group mb-3">
                                                            <span class="input-group-text">Description *</span>
                                                            <textarea name="description"  class="form-control" aria-label="With textarea">${resource.description}</textarea>
                                                        </div>
                                                        <div class="mb-3">
                                                            <div class="input-group mb-3">
                                                                <div class="input-group-prepend">
                                                                    <label class="input-group-text"
                                                                           for="inputGroupSelect01">Topic *</label>
                                                                </div>

                                                                <label name="topicname"  class="custom-select" id="inputGroupSelect01"><span>${resource.topic.topicname}</span></label>
                                                                    <!--   <option >Topic 1</option>
                                                                       <option>Topic 2</option>
                                                                        <option value="1">PUBLIC</option> -->

                                                                </label>


                                                            </div>


                                                        </div>
                                                        <div class="mb-3">
                                                            <button type="submit" class="btn btn-primary" id="l1">Update</button>
                                                        </div>



                                                    </g:uploadForm>


                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Cancel</button>
                                                    <!--  <button type="button" class="btn btn-primary" >Save</button>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </g:else>
                            </div>
                        </div>
                        <g:if test="${resource.hasProperty("filePath")}">
                            <div class="col-auto">
                                <div class="mb-3">
                                    <g:link controller="resource" action="documentFile" params="[id:resource.id]" class="link-primary">Download</g:link>
                                </div>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="col-auto">
                                <div class="mb-3">
                                    <a href="${resource.url}" target="_blank" class="link-primary">Open Link</a>
                                </div>
                            </div>
                        </g:else>

                    </div>

                </div>
            </div>

        </div>





        <div class="col-md-6">
            <div class="row mt-2"> </div>
            <div class="row mt-2"> </div>

            %{--<div class="card" id="cardd">
                <div class="card-header">
                    --}%%{--Trending Topics--}%%{--
                </div>
                <div class="card-body">
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
                                    <div class="mb-3">
                                        Uday Pratap Singh

                                    </div>
                                </div>
                                <div class="col-auto">

                                    <a href="#" class="link-primary">Grails</a>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col">


                                    <h9 class="text-muted">Subscriptions</h9>
                                    <a href="#" class="card-link">30</a>

                                </div>

                                <div class="col">
                                    <h9 class="text-muted">Topics</h9>
                                    <a href="#" class="card-link">30</a>

                                </div>

                                <div class="col">
                                    <h9 class="text-muted">@Uday</h9>
                                    <a href="#" class="card-link">Unsubscribed</a>

                                </div>

                            </div>


                        </div>

                    </div>

                </div>
                <div class="divider"></div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-auto">
                            <figure class="figure" id="fif">
                                <img src="https://www.searchpng.com/wp-content/uploads/2019/02/User-Icon-PNG.png"
                                     id="pi1" class="figure-img img-fluid rounded" alt="...">
                            </figure>

                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="card-title">
                                    <div class="row">
                                        <div class="col">
                                            <div class="mb-3">
                                                Uday Pratap Singh

                                            </div>
                                        </div>
                                        <div class="col-auto">

                                            <a href="#" class="link-primary">Grails</a>

                                        </div>
                                    </div>

                                </div>

                            </div>
                            <div class="row">
                                <div class="col">


                                    <h9 class="text-muted">Subscriptions</h9>
                                    <a href="#" class="card-link">30</a>

                                </div>

                                <div class="col">
                                    <h9 class="text-muted">Topics</h9>
                                    <a href="#" class="card-link">30</a>

                                </div>

                                <div class="col">
                                    <h9 class="text-muted">@Uday</h9>
                                    <a href="#" class="card-link">Unsubscribed</a>

                                </div>

                            </div>


                        </div>

                    </div>
                    <div class="row">
                        <div class="col">
                            <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option selected>select</option>
                                <option value="1">Serious</option>
                                <option value="2">Very Serious</option>
                                <option value="3">Casual</option>
                            </select>
                        </div>
                        <div class="col">
                            <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option selected>select</option>
                                <option value="1">Pubic</option>
                                <option value="2">Private</option>

                            </select>
                        </div>
                        <div class="col-auto">
                            <a href="#" class="link-primary">Edit</a>


                        </div>
                        <div class="col">
                            <a href="#" class="link-primary">Delete</a>


                        </div>





                    </div>


                </div>
            </div>--}%

        </div>

    </div>
    <div class="row-mt-2"></div>
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
<script>
    $(document).ready(function () {
        $('#rateMe2').mdbRate();
    });
</script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>

</html>
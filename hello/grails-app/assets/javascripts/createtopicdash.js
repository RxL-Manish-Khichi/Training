$(document).ready(function() {
    $("#save").click(function(){
        console.log("sucessfully clicked")
        $.ajax(
            {
                url:dataurl,
                data:{
                    visibility:$("#svisible").val(),
                    topicname:$("#topicnamec").val()
                },
                success:function(response){
                    console.log(response)
                }
            })
    })

});
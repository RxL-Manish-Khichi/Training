function rate(id,r)
{
    $.ajax({
        url: rateurl,
        data:{id:id,rating:r},
        success: function (response) {
            console.log("success")
            alert("Topic Rated Successfully")
        }
    });
}
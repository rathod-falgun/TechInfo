function doLike(button, pid, uid) {

    console.log("PID = " + pid);
    console.log("UID = " + uid);

    const d = {
        uid: uid,
        pid: pid,
        operation: "Like"
    };

    console.log("Data Object:");
    console.log(d);

    $.ajax({
        url: "LikeServlet",
        type: "POST",
        data: d,

        success: function(data, textStatus, jqXHR) {

            console.log("Servlet Response: [" + data + "]");
            console.log("Status: " + jqXHR.status);

            data = data.trim();

            let parts = data.split("|");

            let operation = parts[0];
            let count = parseInt(parts[1]);

            console.log("Operation:", operation);
            console.log("Count:", count);

            let counter = $(button).find(".like-counter");
            let icon = $(button).find("i");

            if (operation === "liked") {

                counter.text(count);

                icon.removeClass("fa-regular")
                    .addClass("fa-solid");
	
            }
            else if (operation === "unliked") {

                counter.text(count);

                icon.removeClass("fa-solid")
                    .addClass("fa-regular");

            }
            else {

                console.log("Like failed.");
            }
        },

        error: function(jqXHR, textStatus, errorThrown) {

            console.log("AJAX ERROR");
            console.log("Status:", jqXHR.status);
            console.log("Text:", textStatus);
            console.log("Error:", errorThrown);
            console.log("Response:", jqXHR.responseText);
        }
    });
}

/* Post js Start*/

$(document).ready(function() {

    console.log("script.js loaded");

    $("#add-post-form").on("submit", function(event) {

        event.preventDefault();

        console.log("Form submitted");

        let form = new FormData(this);

        /*  console.log("Category:", form.get("catId"));
          console.log("Title:", form.get("pTitle"));
          console.log("Content:", form.get("pContent"));
          console.log("Code:", form.get("pCode"));
          console.log("Image:", form.get("pic"));
  */
        $.ajax({
            url: "AddPostServlet",
            type: "POST",
            data: form,

            processData: false,
            contentType: false,

            success: function(data, textStatus, jqXHR) {
                Swal.fire({
                    title: "Good Job!",
                    text: "Saved Successfully",
                    icon: "success"
                });
            },

            error: function(jqXHR, textStatus, errorThrown) {
                Swal.fire({
                    title: "Error!",
                    text: "Something went wrong",
                    icon: "error"
                });

                console.log("AJAX ERROR");
                console.log("Status:", jqXHR.status);
                console.log("Status Text:", textStatus);
                console.log("Error:", errorThrown);
                console.log("Response:", jqXHR.responseText);
            }
        });

    });

});

/*Post Js End*/
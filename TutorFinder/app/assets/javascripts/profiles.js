//for Tutor Course List
$(function() {
    $(document).on("click","#showMyCourseList",function(){
        $(this).attr('id','hidMyCourseList');
        $(this).text('Hide My Course List');
        $('#myCourseList').show(300);
    });
});


$(function() {
    $(document).on("click","#hidMyCourseList",function(){
        $(this).attr('id','showMyCourseList');
        $(this).text('Show My Course List');
        $('#myCourseList').hide(300);
    });
});





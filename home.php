<?php date_default_timezone_set('Asia/Manila'); ?>
<?php $loc_details = json_decode(file_get_contents("http://ipinfo.io/json")); ?>
<div class="container py-5">
   <div class="w-100 d-flex justify-content-center my-2">
        <div class="w-auto">
            <div class="w-auto fs-1 fw-bolder text-center" id="time"><?php echo date('h:i:s A') ?></div>
            <div class="w-auto fs-4 fw-bolder text-center" id="date"><?php echo date('M d, Y') ?></div>
        </div>
   </div>
    <div class="w-100 row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-xl-2  gx-4 gy-4 justify-content-center my-2 mx-2">
        <div class="col text-center">
            <button class=" att_btn w-100 text-center btn btn-sm rounded-0 btn-primary" type="button" data-type="IN">Time In</button>
        </div>
        <div class="col text-center">
            <button class=" att_btn w-100 text-center btn btn-sm rounded-0 btn-danger" type="button" data-type="L_OUT">Lunch Break (OUT)</button>
        </div>
        <div class="col text-center">
            <button class=" att_btn w-100 text-center btn btn-sm rounded-0 btn-primary" type="button" data-type="L_IN">After Lunch (IN)</button>
        </div>
        <div class="col text-center">
            <button class=" att_btn w-100 text-center btn btn-sm rounded-0 btn-danger" type="button" data-type="OUT">Time Out</button>
        </div>
    </div>
    <div>
        <h3>My Attendance Logs</h3>
        <hr>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th class="py-1 px-2">DateTime</th>
                    <th class="py-1 px-2">Type</th>
                    <th class="py-1 px-2">Device Type</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $log_type = array('IN'=>'Time IN','L_OUT'=>'Lunch Break (OUT)','L_IN'=>'After Lunch (IN)','OUT'=>'Time Out');
                $qry = $conn->query("SELECT * FROM `attendance_list` where employee_id = '{$_SESSION['employee_id']}' order by strftime('%s',date_created) desc");
                while($row = $qry->fetchArray()):
                ?>
                    <tr>
                        <td class="py-1 px-2"><?php echo date("Y-m-d h:i A",strtotime($row['date_created'])) ?></td>
                        <td class="py-1 px-2"><?php echo $log_type[$row['att_type']] ?></td>
                        <td class="py-1 px-2">
                            <?php if($row['device_type'] == 'desktop'): ?>
                                <span><span class="fa fa-desktop text-primary"></span> Desktop</span>
                            <?php else: ?>
                                <span><span class="fa fa-mobile-alt text-primary"></span> Mobile</span>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</div>

<script>
    var timeInterval;
$(function(){
    timeInterval= setInterval(() => {
            var date = new Date();
            var month = date.toLocaleString('default',{month:'short'})
            var day = date.getDate()
            var year = date.getFullYear()
            var hr = String(date.getHours()).padStart(2,'0')
            var min = String(date.getMinutes()).padStart(2,'0')
            var sec = String(date.getSeconds()).padStart(2,'0')
            var amp = hr >= 12 ? "PM" : "AM"; 
                hr = String(Math.floor(hr % 12)).padStart(2,'0')
            $('#time').text(hr+":"+min+":"+sec+" "+amp)
            $('#date').text(month+" "+day+", "+year)
    }, 500);
    $('.att_btn').click(function(){
        $('.att_btn').attr('disabled',true)
        var time = new Date("YYYY-MM-DD H:i");
        $.ajax({
            url:'Actions.php?a=save_attendance',
            method:'POST',
            data:{type:$(this).attr('data-type'),json_data:'<?php echo json_encode($loc_details) ?>',time:time},
            dataType:'json',
            error:err=>{
                console.log(err)
                alert("an error occured")
                $('.att_btn').attr('disabled',false)
            },
            success:function(resp){
                if(resp.status == 'success'){
                    Swal.fire({
                        title: 'Success!',
                        text: 'Attendance log successfully recorded',
                        icon: 'success',
                        timer: 2000,
                        timerProgressBar: true,
                        willClose: () => {
                            location.reload()
                        }
                    })
                }else{
                    console.log(resp)
                    alert("an error occured")
                }
                $('.att_btn').attr('disabled',false)
            }
        })
    })
})
</script>
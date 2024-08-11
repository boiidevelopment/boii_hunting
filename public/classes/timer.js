/*
     ____   ____ _____ _____   _   _____  ________      ________ _      ____  _____  __  __ ______ _   _ _______ 
    |  _ \ / __ \_   _|_   _| | | |  __ \|  ____\ \    / /  ____| |    / __ \|  __ \|  \/  |  ____| \ | |__   __|
    | |_) | |  | || |   | |   | | | |  | | |__   \ \  / /| |__  | |   | |  | | |__) | \  / | |__  |  \| |  | |   
    |  _ <| |  | || |   | |   | | | |  | |  __|   \ \/ / |  __| | |   | |  | |  ___/| |\/| |  __| | . ` |  | |   
    | |_) | |__| || |_ _| |_  | | | |__| | |____   \  /  | |____| |___| |__| | |    | |  | | |____| |\  |  | |   
    |____/ \____/_____|_____| | | |_____/|______|   \/   |______|______\____/|_|    |_|  |_|______|_| \_|  |_|   
                              | |                                                                                
                              |_|                 HUNTING
*/

class ProgressTimer {
    constructor(message, duration) {
        this.build(message, duration);
    }

    build(message, duration) {
        $('#main_container').fadeOut('fast');
        let content = `
            <div id="prog_timer" class="prog_timer">
                <div class="progress_circle">
                    <canvas id="progress_canvas" width="120" height="120"></canvas>
                    <div class="timer" id="timer"></div>
                </div>
                <div class="status_message" id="status_message">${message}</div>
            </div>
        `;
        $('body').append(content);
        $('#prog_timer').fadeIn('slow');
        let start_time = null;
        let time_left = duration;
        $('#timer').text(time_left);
        const canvas = document.getElementById('progress_canvas');
        const ctx = canvas.getContext('2d');
        const radius = 40;
        const root_styles = getComputedStyle(document.documentElement);
        const bg_colour = root_styles.getPropertyValue('--background').trim();
        const stroke_colour = root_styles.getPropertyValue('--accent_colour').trim();

        function draw_bg() {
            ctx.beginPath();
            ctx.arc(60, 60, radius, 0, 2 * Math.PI, false);
            ctx.fillStyle = bg_colour;
            ctx.fill();
        }

        function draw_progress(progress) {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            draw_bg();
            ctx.beginPath();
            ctx.arc(60, 60, radius, -Math.PI / 2, -Math.PI / 2 + progress * 2 * Math.PI, false);
            ctx.strokeStyle = stroke_colour;
            ctx.lineWidth = 8;

            ctx.stroke();
        }

        function animate(timestamp) {
            if (!start_time) start_time = timestamp;
            let elapsed = (timestamp - start_time) / 1000;
            time_left = duration - elapsed;
            if (time_left < 0) time_left = 0;
            let progress = time_left / duration;
            draw_progress(progress);
            $('#timer').text(Math.ceil(time_left));
            if (time_left > 0) {
                requestAnimationFrame(animate);
            } else {
                $('#main_container').fadeIn('fast');
                $('#prog_timer').fadeOut('slow', () => {
                    $('#prog_timer').remove();
                    prog_timer = null;
                });
            }
        }

        requestAnimationFrame(animate);
    }
}

//const prog_test = new ProgressTimer('Repairing vehicle...', 99);
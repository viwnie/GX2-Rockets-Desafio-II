<div class="container">
        <div class="row">
            <div class="col-12">
                <div class="eye-container">
                    <div class="eye">
                        <div class="pupil"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <#--  Liferay script  -->

     Liferay.on('allPortletsReady', function() {
            const eye = fragmentElement.querySelector('.eye');
            const pupils = fragmentElement.querySelector('.pupil');
            document.addEventListener('mousemove', function(e) {
                    const rect = eye.getBoundingClientRect();
                    const eyeCenterX = rect.left + rect.width / 2;
                    const eyeCenterY = rect.top + rect.height / 2;
                    const angle = Math.atan2(e.clientY - eyeCenterY, e.clientX - eyeCenterX);
                    const distance = Math.min(rect.width / 4, Math.hypot(e.clientX - eyeCenterX, e.clientY - eyeCenterY) / 5);
                    const pupilX = Math.cos(angle) * distance;
                    const pupilY = Math.sin(angle) * distance;
                    eye.querySelector('.pupil').style.transform = `translate(${pupilX}px, ${pupilY}px)`;
            });
 });
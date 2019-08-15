<div class="container">
  <div class="📦"></div>
  <div class="📦"></div>
  <div class="📦"></div>
  <div class="📦"></div>
  <div class="📦"></div>
</div>
<style type="text/css">
 @charset "UTF-8";
:root {
  --duration: 1.5s;
  --container-size: 250px;
  --box-size: 33px;
  --box-border-radius: 25%;
}

html, body {
  width: 100%;
  height: 100%;
  overflow: hidden;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  width: var(--container-size);
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: relative;
}

.📦 {
  width: var(--box-size);
  height: var(--box-size);
  position: relative;
  display: block;
  -webkit-transform-origin: -50% center;
          transform-origin: -50% center;
  border-radius: var(--box-border-radius);
}
.📦:after {
  content: '';
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  right: 0;
  background-color: lightblue;
  border-radius: var(--box-border-radius);
  box-shadow: 0px 0px 10px 0px rgba(28, 159, 255, 0.4);
}
.📦:nth-child(1) {
  -webkit-animation: slide var(--duration) ease-in-out infinite alternate;
          animation: slide var(--duration) ease-in-out infinite alternate;
}
.📦:nth-child(1):after {
  -webkit-animation: color-change var(--duration) ease-in-out infinite alternate;
          animation: color-change var(--duration) ease-in-out infinite alternate;
}
.📦:nth-child(2) {
  -webkit-animation: flip-1 var(--duration) ease-in-out infinite alternate;
          animation: flip-1 var(--duration) ease-in-out infinite alternate;
}
.📦:nth-child(2):after {
  -webkit-animation: squidge-1 var(--duration) ease-in-out infinite alternate;
          animation: squidge-1 var(--duration) ease-in-out infinite alternate;
}
.📦:nth-child(3) {
  -webkit-animation: flip-2 var(--duration) ease-in-out infinite alternate;
          animation: flip-2 var(--duration) ease-in-out infinite alternate;
}
.📦:nth-child(3):after {
  -webkit-animation: squidge-2 var(--duration) ease-in-out infinite alternate;
          animation: squidge-2 var(--duration) ease-in-out infinite alternate;
}
.📦:nth-child(4) {
  -webkit-animation: flip-3 var(--duration) ease-in-out infinite alternate;
          animation: flip-3 var(--duration) ease-in-out infinite alternate;
}
.📦:nth-child(4):after {
  -webkit-animation: squidge-3 var(--duration) ease-in-out infinite alternate;
          animation: squidge-3 var(--duration) ease-in-out infinite alternate;
}
.📦:nth-child(5) {
  -webkit-animation: flip-4 var(--duration) ease-in-out infinite alternate;
          animation: flip-4 var(--duration) ease-in-out infinite alternate;
}
.📦:nth-child(5):after {
  -webkit-animation: squidge-4 var(--duration) ease-in-out infinite alternate;
          animation: squidge-4 var(--duration) ease-in-out infinite alternate;
}
.📦:nth-child(2):after {
  background-color: #1C9FFF;
}
.📦:nth-child(3):after {
  background-color: #1FB1FD;
}
.📦:nth-child(4):after {
  background-color: #22C7FB;
}
.📦:nth-child(5):after {
  background-color: #23D3FB;
}

@-webkit-keyframes slide {
  0% {
    background-color: #1795FF;
    -webkit-transform: translatex(0vw);
            transform: translatex(0vw);
  }
  100% {
    background-color: #23D3FB;
    -webkit-transform: translatex(calc(var(--container-size) - (var(--box-size) * 1.25)));
            transform: translatex(calc(var(--container-size) - (var(--box-size) * 1.25)));
  }
}

@keyframes slide {
  0% {
    background-color: #1795FF;
    -webkit-transform: translatex(0vw);
            transform: translatex(0vw);
  }
  100% {
    background-color: #23D3FB;
    -webkit-transform: translatex(calc(var(--container-size) - (var(--box-size) * 1.25)));
            transform: translatex(calc(var(--container-size) - (var(--box-size) * 1.25)));
  }
}
@-webkit-keyframes color-change {
  0% {
    background-color: #1795FF;
  }
  100% {
    background-color: #23D3FB;
  }
}
@keyframes color-change {
  0% {
    background-color: #1795FF;
  }
  100% {
    background-color: #23D3FB;
  }
}
@-webkit-keyframes flip-1 {
  0%, 15% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  35%, 100% {
    -webkit-transform: rotate(-180deg);
            transform: rotate(-180deg);
  }
}
@keyframes flip-1 {
  0%, 15% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  35%, 100% {
    -webkit-transform: rotate(-180deg);
            transform: rotate(-180deg);
  }
}
@-webkit-keyframes squidge-1 {
  5% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  15% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
  25%, 20% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(0.8) scaley(1.4);
            transform: scalex(0.8) scaley(1.4);
  }
  55%, 100% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  40% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
}
@keyframes squidge-1 {
  5% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  15% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
  25%, 20% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(0.8) scaley(1.4);
            transform: scalex(0.8) scaley(1.4);
  }
  55%, 100% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  40% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
}
@-webkit-keyframes flip-2 {
  0%, 30% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  50%, 100% {
    -webkit-transform: rotate(-180deg);
            transform: rotate(-180deg);
  }
}
@keyframes flip-2 {
  0%, 30% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  50%, 100% {
    -webkit-transform: rotate(-180deg);
            transform: rotate(-180deg);
  }
}
@-webkit-keyframes squidge-2 {
  20% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  30% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
  40%, 35% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(0.8) scaley(1.4);
            transform: scalex(0.8) scaley(1.4);
  }
  70%, 100% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  55% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
}
@keyframes squidge-2 {
  20% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  30% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
  40%, 35% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(0.8) scaley(1.4);
            transform: scalex(0.8) scaley(1.4);
  }
  70%, 100% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  55% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
}
@-webkit-keyframes flip-3 {
  0%, 45% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  65%, 100% {
    -webkit-transform: rotate(-180deg);
            transform: rotate(-180deg);
  }
}
@keyframes flip-3 {
  0%, 45% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  65%, 100% {
    -webkit-transform: rotate(-180deg);
            transform: rotate(-180deg);
  }
}
@-webkit-keyframes squidge-3 {
  35% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  45% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
  55%, 50% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(0.8) scaley(1.4);
            transform: scalex(0.8) scaley(1.4);
  }
  85%, 100% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  70% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
}
@keyframes squidge-3 {
  35% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  45% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
  55%, 50% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(0.8) scaley(1.4);
            transform: scalex(0.8) scaley(1.4);
  }
  85%, 100% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  70% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
}
@-webkit-keyframes flip-4 {
  0%, 60% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  80%, 100% {
    -webkit-transform: rotate(-180deg);
            transform: rotate(-180deg);
  }
}
@keyframes flip-4 {
  0%, 60% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  80%, 100% {
    -webkit-transform: rotate(-180deg);
            transform: rotate(-180deg);
  }
}
@-webkit-keyframes squidge-4 {
  50% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  60% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
  70%, 65% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(0.8) scaley(1.4);
            transform: scalex(0.8) scaley(1.4);
  }
  100%, 100% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  85% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
}
@keyframes squidge-4 {
  50% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  60% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
  70%, 65% {
    -webkit-transform-origin: center bottom;
            transform-origin: center bottom;
    -webkit-transform: scalex(0.8) scaley(1.4);
            transform: scalex(0.8) scaley(1.4);
  }
  100%, 100% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1) scaley(1);
            transform: scalex(1) scaley(1);
  }
  85% {
    -webkit-transform-origin: center top;
            transform-origin: center top;
    -webkit-transform: scalex(1.3) scaley(0.7);
            transform: scalex(1.3) scaley(0.7);
  }
}

</style>
<script type="text/javascript">
  (function(){
  
  var icon = '<svg class="sg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 185.31 251.89"><path d="M66.8,144.17c0-66.24,22.46-113.09,80.72-112.32,81.48,1.07,80.72,46.08,80.72,112.32,0,5.15,8.38,3.81,7.62,19-2.28,19.42-9.44,14.63-10.39,19.85-9.26,51.08-40.65,88.67-77.95,88.67-37.76,0-69.47-38.53-78.28-90.58-.82-4.85-5.86-.8-6.42-18.68C61.47,146.07,66.8,149.07,66.8,144.17Z" transform="translate(-56.6 -25.84)" style="fill:#ffdfbf;fill-rule:evenodd"/><path d="M147.52,31.85C99.49,31.22,75.79,63,69,111.24c8.78-23.84,27.86-26,64.33-26.54,70.62-1.13,88.39,8.27,79.64,96.55-1.84,18.6-6.1,24.62-28.36,39.74-12.07,8.2,18.54-26.37-49.78-27-49.5-.43-30.06,36.41-40.06,29.44a81.88,81.88,0,0,1-20.28-20.73c12.89,40.76,40.76,69,73.08,69,37.3,0,68.69-37.59,77.95-88.67l2.77-38.89C228.24,77.93,229,32.91,147.52,31.85Z" transform="translate(-56.6 -25.84)" style="fill:#d0b57b;fill-rule:evenodd"/><path d="M146.13,31.84h1.39c81.48,1.07,80.72,46.08,80.72,112.33,0,5.15,8.38,3.81,7.62,19-2.28,19.42-9.44,14.63-10.39,19.85-9.26,51.08-40.65,88.67-77.95,88.67-37.76,0-69.47-38.53-78.28-90.58-.82-4.85-5.86-.8-6.42-18.68-1.34-16.39,4-13.39,4-18.29,0-65.71,22.11-112.33,79.33-112.33m0-6h0c-29.39,0-51.65,11.54-66.18,34.3C67.3,80,60.86,108.06,60.8,143.68h0c-2.54,3.05-4.94,7-4,19.12.4,12.11,2.72,16.46,6.59,19.86,9.65,56,44.19,95.07,84.11,95.07,19.91,0,38.59-9.42,54-27.25,14.35-16.57,24.87-39.79,29.66-65.45l0,0c4.22-2.57,8.87-6.53,10.58-21.1l0-.2v-.2c.58-11.55-3.35-16.18-7.07-19.61l-.53-.5v-1c0-33,0-61.46-10.76-82.11-12-23-36.09-33.89-75.88-34.41Z" transform="translate(-56.6 -25.84)" style="fill:#303030"/><path d="M118.31,183.29s4.28,4.28,12.84,4S143.67,182,143.67,182s-3.62,8.23-11.53,8.89S118.31,183.29,118.31,183.29Z" transform="translate(-56.6 -25.84)" style="fill:#bfa78f;fill-rule:evenodd"/><ellipse cx="44.24" cy="115.64" rx="28.15" ry="35.97" style="fill:#fff"/><ellipse cx="104.54" cy="115.64" rx="28.15" ry="35.97" style="fill:#fff"/><circle class="eye" id="eye-left" cx="35.9" cy="121.66" r="10.5" style="fill:#303030"/><circle class="eye" cx="94.57" cy="121.66" r="10.5" style="fill:#303030"/><path d="M140.74,236.63h0c-16.92,0-29.43-4.38-29.43-18.42h0c0-4.22,4.12-7.64,9.21-7.64H160c3.6,0,6.53,2.42,6.53,5.42v7.23C166.55,234.48,154.32,236.63,140.74,236.63Z" transform="translate(-56.6 -25.84)" style="fill:#2d251d;fill-rule:evenodd"/><path d="M160,210.57h-39.5c-5.09,0-9.21,3.42-9.21,7.64,0,.07,0,.15,0,.22,7.57,2.29,17.6,3.2,29,3.2h0c9.87,0,19.24-.52,26.25-2.36V216C166.55,213,163.62,210.57,160,210.57Z" transform="translate(-56.6 -25.84)" style="fill:#fff"/></svg>';

  document.head.insertAdjacentHTML('beforeend','<style>.sg { width: 35px; height: 35px; position: fixed; bottom: 10px; right: 10px; } .sg .eye { -webkit-transform: translateX(0px);   transform: translateX(0px); } .sg:hover .eye { -webkit-transition: -webkit-transform 0.3s ease; transition: -webkit-transform 0.3s ease; transition: transform 0.3s ease; transition: transform 0.3s ease, -webkit-transform 0.3s ease; -webkit-transform: translateX(12px);   transform: translateX(12px); }</style>'); 
  
  var a = document.createElement('a');
  a.setAttribute('href','https://twitter.com/steveg3003');
  a.setAttribute('target','_blank');
  a.innerHTML = icon;
    
  document.body.appendChild(a);
})();
</script>
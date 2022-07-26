// 需求：1.当页面划到banner部分时  侧边栏保持位置不变 没到banner区域时侧边栏跟着页面滑动
        // 2.页面再滑动  到main部分时 返回顶部部分显示
        // 获取事件
        var slider_bar = document.querySelector('.slider-bar');
        var banner = document.querySelector('.banner');
        var bannerTop = banner.offsetTop; // 页面被卷去头部的大小:banner距页面顶部的距离
        var slider_bar_top = slider_bar.offsetTop - bannerTop; // 变成固定定位之后的位置
        // console.log(bannerTop);
 
        var main = document.querySelector('.main');
        var goBack = document.querySelector('.goBack');
        var mainTop = main.offsetTop; // main相对页面顶部的距离
 
        // 页面滚动事件
        document.addEventListener('scroll', function () {
            // console.log('srcoll');
            // 当页面滚动到banner时，就把侧边栏改为固定定位
            // 距离就是banner距离页面顶部的高度 banner.scrollTop
            if (window.pageYOffset >= bannerTop) {
                slider_bar.style.position = 'fixed';
                slider_bar.style.top = slider_bar_top + 'px';
            } else {
                slider_bar.style.position = 'absolute';
                slider_bar.style.top = '300px';
            }
            // 当页面滑到main区域时 返回顶部部分显示
            if (window.pageYOffset >= mainTop) {
                goBack.style.display = 'block';
            } else {
                goBack.style.display = 'none';
            }
        })

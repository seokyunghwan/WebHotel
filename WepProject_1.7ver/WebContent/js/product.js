function openTab(evt, tabName) {
	let i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	document.getElementById(tabName).style.display = "flex";
	evt.currentTarget.className += " active";
}


let slides = document.querySelector('.slides'), 
	slide = document.querySelectorAll('.slides li'), 
	currentIdx = 0, 
	slideCount = slide.length, 
	prevBtn = document.querySelector('.prev'), 
	slideWidth = 50, 
	slideMargin = 10, 
	nextBtn = document.querySelector('.next');

	slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 2+ 'px';

	
	
nextBtn.addEventListener('click', function() {
	if (currentIdx < slideCount - 1) {
		if (!($('.slides li:last-child').is('.spic.on'))) {
			$('.spic.on').next().addClass("on").siblings().removeClass("on");
		}
		moveSlide(currentIdx + 1);
	} else {
		$('.slides li').first().addClass("on").siblings().removeClass("on");
		moveSlide(0);
	}

});
prevBtn.addEventListener('click', function() {
	if (currentIdx > 0) {
		if (!($('.slides li:first-child').is('.spic.on'))) {
			$('.spic.on').prev().addClass("on").siblings().removeClass("on");
		}
		moveSlide(currentIdx - 1);
	} else {
		$('.slides li').last().addClass("on").siblings().removeClass("on");
		moveSlide(slideCount - 3);
	}

});

function moveSlide(num) {
	slides.style.left = -num * 60 + 'px';
	currentIdx = num;

	let address = $('.spic.on img').attr('src');
	$('#bpic img').attr('src', address);

}

let spics = $('.slides li');

for (let i = 0; i < spics.length; i++) {
	(function(i) {
		spics[i].addEventListener("click", aa)
		function aa() {
			let address = $(this).children('img');
			$('#bpic img').attr('src', address.attr('src'));
			$(this).addClass("on").siblings().removeClass("on");
			moveSlide(i);
		}
	})(i);
}

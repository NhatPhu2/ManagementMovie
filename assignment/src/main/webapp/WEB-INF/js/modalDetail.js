

//click out of modal to close
const moda = document.querySelector('.modal');
//stop duplicate action when clicking
const modalContainer = document.querySelector('.modal-container');

//click button to show movie detail
const infoDetail = document.querySelectorAll('.info-detail');

const close = document.querySelector('.close');
//click image to show movie detail
const clickImage = document.querySelectorAll('.img-video');

//click icon to show movie detail
const iconOpen = document.querySelectorAll('.fa-circle-chevron-down');

//add class show
function showDetail() {
	moda.classList.add('show');
}

//remove class show
function hideDetail() {
	moda.classList.remove('show');
}

//click Font down arrow to show
for (const icon of iconOpen) {
	icon.addEventListener('click', showDetail);
}

//click image to show
for (const img of clickImage) {
	img.addEventListener('click', showDetail);
}

//close button
close.addEventListener('click', hideDetail);

//make current button click
modalContainer.addEventListener('click', function(event) {
	event.stopPropagation();
});
//click out of to close
moda.addEventListener('click', hideDetail);

//click out of modal to close
const modashare = document.querySelector('.modalshare');
//stop duplicate action when clicking
const modalsharelContainer = document.querySelector('.modalshare-container');


const btShare = document.querySelectorAll('.share-bt');
const iconShare = document.querySelectorAll('.fa-share');

function showShare() {
	modashare.classList.add('showshare');
}

//remove class show
function hideShare() {
	modashare.classList.remove('showshare');
}


for (const bShare of btShare) {
	bShare.addEventListener('click', showShare);
}

for (const iShare of iconShare) {
	iShare.addEventListener('click', showShare);
}


//make current button click
modalsharelContainer.addEventListener('click', function(event) {
	event.stopPropagation();
});
//click out of to close
modashare.addEventListener('click', hideShare);
const modal = document.querySelector('.search-key');
const clickSearch = document
	.querySelector('.fa-magnifying-glass');
const iconFont = document
	.querySelector(".fa-magnifying-glass");
const container = document.querySelector('.container');
const heading = document.querySelector('#heading');
const sub = document.querySelector('.sub');

function showSearch() {
	modal.classList.add('show');
	modal.focus();
	iconFont.style.display = "none";
}

function hideSearch() {
	modal.classList.remove('show');
	iconFont.style.display = "inline";
}
clickSearch.addEventListener('click', showSearch);
container.addEventListener('click', hideSearch);
heading.addEventListener('click', hideSearch);
sub.addEventListener('click', function(event) {
	event.stopPropagation();
});
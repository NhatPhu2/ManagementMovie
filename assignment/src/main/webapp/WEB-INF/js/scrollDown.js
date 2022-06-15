

const bodyTag = document.querySelector("body");
const myHeading = document.querySelector("#heading");

var scrolled = function(){
 let dec = scrollY / (bodyTag.scrollHeight - innerHeight);
 return Math.floor(dec * 10);
}

addEventListener("scroll", () =>{
myHeading.style.setProperty("background",scrolled() > 0 ? "var(--background-color2)": "var(--background-color1)")
})



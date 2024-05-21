let viewportWidth = window.innerWidth;
console.log(viewportWidth);

function shiftPanel() {  
  const vw = Math.max(document.documentElement.clientWidth || 0, window.innerWidth || 0)
  console.log("Hello123124");
  const card = document.getElementById('textCard');
  let closeBtn = document.getElementById('closeBtn');
  let msg = document.getElementById('textHeading').innerHTML;
  if (msg === "Welcome Back") {    
    document.getElementById('textHeading').innerHTML = "Welcome";
    document.getElementById('textPara').innerHTML = "We're thrilled to have you join our community. By signing up today, you're embarking on a journey filledwith exciting opportunities and connections. We can't wait for you to explore all that we have to offer. Your account is just a few steps away from being created. If you ever have questions or need assistance, our support team is here to help. Thank you for choosing us – let's make this the beginning of something extraordinary together!";
    
    card.style.transform = 'translateX(430px)';
    const signInFrm = document.getElementById('signInFrmRight');
    const signUpFrm = document.getElementById('signUpFrmRight');
    signInFrm.style.opacity = '0';
    signInFrm.style.zIndex = '10';
    signUpFrm.style.opacity = '1';
    signUpFrm.style.zIndex = '20';
    signInFrm.style.transform = 'translateX(-450px)';
    signUpFrm.style.transform = 'translateX(-510px)';
    console.log("hello")
  }
  else {
//    console.log("hello")
    document.getElementById('textHeading').innerHTML = "Welcome Back";
    document.getElementById('textPara').innerHTML = "Your presence brightens our digital space. Please enter your credentials below to access your account and continue your journey with us. We're delighted to have you back, and we're committed to ensuring a seamless and secure experience. If you encounter any challenges or have any questions, our support team is here to assist you. Thank you for choosing us, and let's make your time here exceptional!";
    
    card.style.transform = 'translateX(0)';
    const signInFrm = document.getElementById('signInFrmRight');
    const signUpFrm = document.getElementById('signUpFrmRight');
    signInFrm.style.opacity = '1';
    signInFrm.style.zIndex = '20';
    signUpFrm.style.opacity = '0';
    signUpFrm.style.zIndex = '10';
    signInFrm.style.transform = 'translateX(0)';
    signUpFrm.style.transform = 'translateX(0)'; 
  }
}

let menuBtn = document.getElementById("menu-btn").addEventListener('click', sideBar);
let mainBanner = document.getElementById("mainBanner").addEventListener('click', sideBar);
let categories = document.getElementById("categories").addEventListener('click', sideBar);
let sideBarCloseBtn = document.getElementById("close_btn").addEventListener('click', sideBar);

function sideBar(e) {
    let sideBarMenu = document.getElementById("sideBarMenu");
    if (e.srcElement.id === "menu-btn") {      
        sideBarMenu.style.transform = "translateX(0px)";
    } else if (e.srcElement.id === "mainBanner") {
        sideBarMenu.style.transform = "translateX(-370px)";
    } else if (e.srcElement.id === "categories") {
        sideBarMenu.style.transform = "translateX(-370px)";
    } else if (e.srcElement.id === "close_btn") {
        sideBarMenu.style.transform = "translateX(-370px)";
    }
}

// for making a query string
// let link = document.getElementById("link");
// link.href = link.href + "?q=" + 'query value for google';

// Account Panel Show
let account = document.getElementById("account");

let viewportWidth = window.innerWidth;
console.log(viewportWidth);

function shiftPanel(e) {  
    const card = document.getElementById('textCard');
    let closeBtn = document.getElementById('closeBtn');
    let msg = document.getElementById('textHeading').innerHTML;
    
    if (viewportWidth <= 425) {
        console.log("In if of Viewport");
        const signInFrm = document.getElementById('signInFrmRight');
        const signUpFrm = document.getElementById('signUpFrmRight');
        if (e.id === "sgBtn1") {
            console.log("In inner if of SgBtn1");
            signInFrm.style.opacity = '0';
            signInFrm.style.zIndex = '10';
            signUpFrm.style.opacity = '1';
            signUpFrm.style.zIndex = '20';
        } else if (e.id === "lgBtn2") {
            console.log("In inner if of LgBtn2");
            signInFrm.style.opacity = '1';
            signInFrm.style.zIndex = '20';
            signUpFrm.style.opacity = '0';
            signUpFrm.style.zIndex = '10';
        }
    } else if (viewportWidth <= 768) {
        console.log("In else if of Viewport");
        const signInFrm = document.getElementById('signInFrmRight');
        const signUpFrm = document.getElementById('signUpFrmRight');
        const textCard = document.getElementById('textCard');
        if (e.id === "sgBtn1") {
            console.log("In inner if of SgBtn1");
            signInFrm.style.opacity = '0';
            signInFrm.style.zIndex = '10';
            signUpFrm.style.opacity = '1';
            signUpFrm.style.zIndex = '20';
            textCard.style.transform = 'translateX(370px)';
            signInFrm.style.transform = 'translateX(-450px)';
            signUpFrm.style.transform = 'translateX(-430px)';
        } else if (e.id === "lgBtn2") {
            console.log("In inner if of LgBtn2");
            signInFrm.style.opacity = '1';
            signInFrm.style.zIndex = '20';
            signUpFrm.style.opacity = '0';
            signUpFrm.style.zIndex = '10';
            textCard.style.transform = 'translateX(0px)';
            signInFrm.style.transform = 'translateX(0px)';
            signUpFrm.style.transform = 'translateX(0px)';
        }
    } else {
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
          }
          else {
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
}

try {
    let menuBtn = document.getElementById("menu-btn").addEventListener('click', sideBar);
    let sideBarCloseBtn = document.getElementById("close_btn").addEventListener('click', sideBar);
} catch (err) {
    console.log("Error: Element not found "+err);
}

function sideBar(e) {
    let sideBarMenu = document.getElementById("sideBarMenu");
    if (e.srcElement.id === "menu-btn") {      
        sideBarMenu.style.transform = "translateX(0px)";
    } else if (e.srcElement.id === "close_btn") {
        sideBarMenu.style.transform = "translateX(-370px)";
    }
}

// Account Panel Show
try {
    document.getElementById("accHeading").addEventListener('mouseover', showAccPanel);
    document.getElementById("accPanel").addEventListener('mouseleave', showAccPanel);
} catch (err) {
    console.log("Error: Element not found "+err);
}


function showAccPanel (e) {
    let accPanel = document.getElementById("accPanel");
    if (e.srcElement.id === "accHeading") {
        accPanel.style.display = "block";        
    } else if (e.srcElement.id === "accPanel") {      
        accPanel.style.display = "none";    
    }
}


// Cart Bar Show
try {
    document.getElementById("cart").addEventListener('click', showCart);
    document.getElementById("cartNumber").addEventListener('click', showCart);
    document.getElementById("cartIco").addEventListener('click', showCart);
    document.getElementById("cartHeading").addEventListener('click', showCart);
    document.getElementById("cart_close_btn").addEventListener('click', showCart) ;
} catch (err) {
    console.log("Error: Element not found "+err);
}


function showCart(e) {
    let cartBar = document.getElementById("cartBar");
    if (e.srcElement.id === "cart") {
        cartBar.style.transform = "translateX(0px)";
        cartBar.style.display = "flex";
        cartBar.style.flexDirection = "column";
    } else if (e.srcElement.id === "cartNumber") {
        cartBar.style.transform = "translateX(0px)";
        cartBar.style.display = "flex";
        cartBar.style.flexDirection = "column";
    } else if (e.srcElement.id === "cartIco") {
        cartBar.style.transform = "translateX(0px)";
        cartBar.style.display = "flex";
        cartBar.style.flexDirection = "column";
    } else if (e.srcElement.id === "cartHeading") {
        cartBar.style.transform = "translateX(0px)";
        cartBar.style.display = "flex";
        cartBar.style.flexDirection = "column";
    } else if (e.srcElement.id === "cart_close_btn") {
        cartBar.style.transform = "translateX(850px)";
        cartBar.style.display = "none";
    }
}
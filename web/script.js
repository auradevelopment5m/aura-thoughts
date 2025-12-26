let currentThought = null;
let thoughtTimeout = null;

window.addEventListener('message', function(event) {
    var item = event.data;
    if (item.type === "showThought") {
        showThought(item.text, item.icon, item.duration, item.iconColor, item.borderColor);
    } else if (item.type === "hideThought") {
        hideThought();
    }
});

function showThought(text, icon, duration, iconColor, borderColor) {
    var thoughtBubble = document.getElementById('thought-bubble');
    var thoughtText = document.getElementById('thought-text');
    var thoughtIcon = document.getElementById('thought-icon');

    if (thoughtBubble && thoughtText && thoughtIcon) {
        if (thoughtTimeout) {
            clearTimeout(thoughtTimeout);
            thoughtTimeout = null;
        }
        if (currentThought) {
            thoughtBubble.style.opacity = '0';
            setTimeout(() => {
                updateThought(text, icon, duration, iconColor, borderColor);
            }, 100);
        } else {
            updateThought(text, icon, duration, iconColor, borderColor);
        }
    } else {
        console.error('One or more elements not found');
    }
}

function updateThought(text, icon, duration, iconColor, borderColor) {
    var thoughtBubble = document.getElementById('thought-bubble');
    var thoughtText = document.getElementById('thought-text');
    var thoughtIcon = document.getElementById('thought-icon');

    thoughtText.textContent = text;
    thoughtIcon.className = 'fas ' + icon;

    // Apply colors
    if (iconColor) {
        thoughtIcon.style.color = iconColor;
    } else {
        thoughtIcon.style.color = '#b0b0b0'; // default
    }

    if (borderColor) {
        thoughtBubble.style.borderColor = borderColor;
    } else {
        thoughtBubble.style.borderColor = 'rgba(255, 255, 255, 0.1)'; // default
    }

    thoughtBubble.style.display = 'flex';
    setTimeout(() => {
        thoughtBubble.style.opacity = '1';
    }, 10);

    if (thoughtText.scrollWidth > thoughtText.clientWidth) {
        thoughtText.style.whiteSpace = 'normal';
    } else {
        thoughtText.style.whiteSpace = 'nowrap';
    }

    currentThought = { text, icon, duration, iconColor, borderColor };

    if (duration) {
        thoughtTimeout = setTimeout(() => {
            hideThought();
        }, duration);
    }
}

function hideThought() {
    var thoughtBubble = document.getElementById('thought-bubble');

    if (thoughtBubble) {
        thoughtBubble.style.opacity = '0';
        setTimeout(() => {
            thoughtBubble.style.display = 'none';
            currentThought = null;
        }, 500);
    }

    // Clear any existing timeout
    if (thoughtTimeout) {
        clearTimeout(thoughtTimeout);
        thoughtTimeout = null;
    }
}
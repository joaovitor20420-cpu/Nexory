document.addEventListener("DOMContentLoaded", () => {
    // Scroll Reveal 
    const revealElements = document.querySelectorAll('.reveal');

    const revealOnScroll = () => {
        const windowHeight = window.innerHeight;
        const revealPoint = 50; 

        revealElements.forEach(element => {
            const rect = element.getBoundingClientRect();
            
            if (rect.top < windowHeight - revealPoint && rect.bottom > 0) {
                element.classList.add('active');
            } else {
                element.classList.remove('active');
            }
        });
    };

    // Scroll Event Batching
    window.addEventListener('scroll', () => {
        revealOnScroll();
    });

    // Custom Cursor
    const cursor = document.getElementById('cursor');

    if (cursor) {
        document.addEventListener('mousemove', (e) => {
            cursor.style.transform = `translate(${e.clientX - 4}px, ${e.clientY - 4}px)`;
        });

        // Add hovering effects on interactive elements
        const iterables = document.querySelectorAll('a, button, .service-card, .bento-item');
        iterables.forEach(item => {
            item.addEventListener('mouseenter', () => {
                cursor.style.transform = `translate(${cursor.style.transform.match(/translate\((.*?)\)/)[1]}) scale(4)`;
                cursor.style.backgroundColor = 'var(--color-primary-container)';
            });

            item.addEventListener('mouseleave', () => {
                const match = cursor.style.transform.match(/translate\((.*?)\)/);
                if (match) {
                     cursor.style.transform = `translate(${match[1]})`;
                }
                cursor.style.backgroundColor = 'var(--color-tertiary)';
            });
        });
    }

    // Magnetic Buttons
    const magneticElements = document.querySelectorAll('.magnetic');
    
    magneticElements.forEach((el) => {
        const textElement = el.querySelector('.magnetic-text');
        
        el.addEventListener('mousemove', (e) => {
            const rect = el.getBoundingClientRect();
            // Calculate center of element
            const hx = rect.left + rect.width / 2;
            const hy = rect.top + rect.height / 2;
            
            // Distance from center
            const dx = (e.clientX - hx) / 3;
            const dy = (e.clientY - hy) / 3;
            
            // Move button 
            el.style.transform = `translate(${dx}px, ${dy}px) scale(1.05)`;
            el.style.boxShadow = `0 0 30px rgba(123, 46, 255, 0.6), 0 0 60px rgba(123, 46, 255, 0.3)`;
            
            // Move text a bit more for 3D effect
            if(textElement) {
                textElement.style.transform = `translate(${dx * 0.5}px, ${dy * 0.5}px)`;
            }
        });
        
        el.addEventListener('mouseleave', () => {
            el.style.transform = '';
            el.style.boxShadow = '';
            if(textElement) {
                textElement.style.transform = '';
            }
        });
    });

    // Glow Cards 
    const glowCards = document.querySelectorAll('.glow-card');
    
    const handleOnMouseMove = e => {
        const { currentTarget: target } = e;
        const rect = target.getBoundingClientRect();
        
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        
        target.style.setProperty('--mouse-x', `${x}px`);
        target.style.setProperty('--mouse-y', `${y}px`);
    };

    for(const card of glowCards) {
        card.onmousemove = e => handleOnMouseMove(e);
    }
});

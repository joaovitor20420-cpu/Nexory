document.addEventListener("DOMContentLoaded", () => {
    // Scroll Reveal 
    const revealElements = document.querySelectorAll('.reveal');

    const revealOnScroll = () => {
        const windowHeight = window.innerHeight;
        const revealPoint = 150; // pixels before element is fully visible

        revealElements.forEach(element => {
            const elementTop = element.getBoundingClientRect().top;

            if (elementTop < windowHeight - revealPoint) {
                element.classList.add('active');
            }
        });
    };

    // Initial check and on scroll
    revealOnScroll();
    window.addEventListener('scroll', revealOnScroll);

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
                cursor.style.transform = cursor.style.transform.replace(' scale(4)', '');
                cursor.style.backgroundColor = 'var(--color-tertiary)';
            });
        });
    }
});

// import this after install `@mdi/font` package
import '@mdi/font/css/materialdesignicons.css'

import 'vuetify/styles'
import { createVuetify } from 'vuetify'

// export default defineNuxtPlugin((app) => {
//     const vuetify = createVuetify({
//         // ... your configuration
//     })
//     app.vueApp.use(vuetify)
// })

const shadcnTheme = {
    dark: true, // Switch to dark mode
    colors: {
        background: '#1A202C', // Dark background
        surface: '#2D3748',     // Slightly lighter for surfaces
        'surface-bright': '#2D3748',
        'surface-light': '#4A5568',
        'surface-variant': '#4A5568',
        'on-surface-variant': '#CBD5E0', // Light text on surfaces
        primary: '#3B82F6', // Soft blue accent
        'primary-darken-1': '#2563EB',
        secondary: '#FBBF24', // Amber for secondary accents
        'secondary-darken-1': '#F59E0B',
        error: '#EF4444',    // Red for errors
        info: '#60A5FA',     // Light blue for info
        success: '#10B981',  // Emerald green for success
        warning: '#F59E0B',  // Amber for warnings
    },
    variables: {
        'border-color': '#4A5568', // Neutral border color
        'border-opacity': 0.2,     // Slight opacity for borders
        'high-emphasis-opacity': 0.95,
        'medium-emphasis-opacity': 0.7,
        'disabled-opacity': 0.4,
        'idle-opacity': 0.05,
        'hover-opacity': 0.1,
        'focus-opacity': 0.15,
        'selected-opacity': 0.1,
        'activated-opacity': 0.15,
        'pressed-opacity': 0.15,
        'dragged-opacity': 0.1,
        'theme-kbd': '#4A5568',      // Keyboard background
        'theme-on-kbd': '#E2E8F0',    // Keyboard text
        'theme-code': '#2D3748',     // Code block background
        'theme-on-code': '#F7FAFC',  // Code text
    }
}


export default defineNuxtPlugin((app) => {
    const vuetify = createVuetify({
        // ... your configuration
        theme: {
            defaultTheme: 'shadcnTheme',
            themes: {
                shadcnTheme: {
                    dark: true, // shadcn often uses a dark theme
                },
            },

        },
       
    })
    app.vueApp.use(vuetify)
})


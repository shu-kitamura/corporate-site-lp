<?php

declare(strict_types=1);

function hello_corp_setup(): void
{
    add_theme_support('editor-styles');
    add_editor_style('style.css');
}

add_action('after_setup_theme', 'hello_corp_setup');

function hello_corp_enqueue_assets(): void
{
    wp_enqueue_style(
        'hello-corp-style',
        get_stylesheet_uri(),
        [],
        wp_get_theme()->get('Version')
    );
}

add_action('wp_enqueue_scripts', 'hello_corp_enqueue_assets');

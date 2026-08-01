<script lang="ts">
	import './layout.css';
	import { ModeWatcher } from 'mode-watcher';
	import SiteNav from '$lib/components/site-nav.svelte';
	import SiteFooter from '$lib/components/site-footer.svelte';

	let { children } = $props();
</script>

<svelte:head><link rel="icon" href="/logo-icon.webp" /></svelte:head>

<ModeWatcher />

<div class="flex min-h-screen flex-col bg-background text-foreground selection:bg-primary selection:text-primary-foreground">
	<SiteNav />
	<main class="flex-1">
		{@render children()}
	</main>
	<SiteFooter />
</div>

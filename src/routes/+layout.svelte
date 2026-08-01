<script lang="ts">
	import './layout.css';
	import { ModeWatcher, mode } from 'mode-watcher';
	import { Toaster } from 'svelte-sonner';
	import SiteNav from '$lib/components/site-nav.svelte';
	import SiteFooter from '$lib/components/site-footer.svelte';
	import { page } from '$app/state';

	let { children, data } = $props();
</script>

<svelte:head>
	<link rel="icon" href="/logo-icon.webp" />
	<noscript>
		<!-- Belt and braces alongside the @media (scripting: none) rule in layout.css. -->
		<style>
			[data-reveal] {
				opacity: 1 !important;
				transform: none !important;
				filter: none !important;
			}
		</style>
	</noscript>
</svelte:head>

<ModeWatcher />
<Toaster theme={mode.current} richColors closeButton position="top-right" />

{#if page.url.pathname === '/dashboard' || page.url.pathname.startsWith('/dashboard/')}
	{@render children?.()}
{:else}

<div
	class="flex min-h-screen flex-col bg-background text-foreground selection:bg-primary selection:text-primary-foreground"
>
	<SiteNav />
	<main class="flex-1">
		<!-- Keyed on the path so each navigation replays the page's entrance animations. -->
		{#key page.url.pathname}
			<div class="enter-fade" style="--enter-duration: 500ms">
				{@render children()}
			</div>
		{/key}
	</main>
	<SiteFooter settings={data.settings} partners={data.partners} />
</div>
{/if}

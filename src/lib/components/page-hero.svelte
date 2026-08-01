<script lang="ts">
	import type { Snippet } from 'svelte';
	import type { Hero } from '$lib/types';
	import { assetUrl } from '$lib/assets';

	let {
		hero,
		size = 'md',
		children
	}: {
		hero: Hero;
		/** `lg` is the taller treatment used on the home page. */
		size?: 'md' | 'lg';
		children?: Snippet;
	} = $props();
</script>

<section class="relative isolate overflow-hidden {size === 'lg' ? 'py-32 lg:py-44' : 'py-28 lg:py-36'}">
	<img
		src={assetUrl(hero.image)}
		alt={hero.imageAlt ?? ''}
		class="enter-kenburns absolute inset-0 -z-20 h-full w-full object-cover"
	/>
	<div
		class="enter-fade absolute inset-0 -z-10 bg-linear-to-b from-black/75 via-black/60 to-black/85"
		style="--enter-duration: 1400ms"
	></div>
	<div class="container mx-auto px-4 text-center sm:px-6">
		{#if hero.eyebrow}
			<p
				class="enter-down mb-4 text-sm font-semibold tracking-widest text-primary-foreground/90 uppercase"
				style="--enter-delay: 150ms"
			>
				{hero.eyebrow}
			</p>
		{/if}
		<h1
			class="enter-rise mx-auto max-w-4xl font-heading text-5xl font-bold tracking-tight text-balance text-white {size ===
			'lg'
				? 'md:text-7xl'
				: 'md:text-6xl'}"
			style="--enter-delay: 250ms"
		>
			{hero.title}
			{#if hero.titleAccent}<span class="text-primary">{hero.titleAccent}</span>{/if}
		</h1>
		{#if hero.tagline}
			<p class="enter-up mt-4 text-xl text-white/85" style="--enter-delay: 380ms">{hero.tagline}</p>
		{/if}
		{#if hero.body}
			<p class="enter-up mx-auto mt-8 max-w-2xl text-lg text-white/80" style="--enter-delay: 520ms">
				{hero.body}
			</p>
		{/if}
		{@render children?.()}
	</div>
</section>

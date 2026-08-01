<script lang="ts">
	import { reveal } from '$lib/actions/reveal';

	let {
		title,
		subtitle,
		align = 'center',
		rule = false
	}: {
		title: string;
		subtitle?: string | null;
		align?: 'center' | 'start';
		/** The short accent rule used under the two-column section headings. */
		rule?: boolean;
	} = $props();
</script>

<div class={align === 'center' ? 'mx-auto max-w-2xl text-center' : ''}>
	<h2 use:reveal class="font-heading text-3xl font-bold md:text-4xl">{title}</h2>
	{#if rule}
		<div use:reveal={{ delay: 120, y: 0 }} class="reveal-rule mt-4 h-px w-16 bg-primary"></div>
	{/if}
	{#if subtitle}
		<p use:reveal={{ delay: 120 }} class="mt-4 text-muted-foreground">{subtitle}</p>
	{/if}
</div>

<script lang="ts">
	import PageHero from '$lib/components/page-hero.svelte';
	import DynamicIcon from '$lib/components/dynamic-icon.svelte';
	import { reveal, stagger } from '$lib/actions/reveal';
	import { MapPin } from '@lucide/svelte';
	import { assetUrl } from '$lib/assets';
	import type { PageData } from './$types';

	let { data }: { data: PageData } = $props();
</script>

<svelte:head>
	<title>Ventures | Fahem General Trading</title>
</svelte:head>

{#if data.hero}
	<PageHero hero={data.hero} />
{/if}

<section class="space-y-16 py-20">
	{#each data.ventures as venture (venture.id)}
		<div class="container mx-auto px-4 sm:px-6">
			<div
				use:reveal={{ y: 40, scale: 0.98, duration: 1100 }}
				class="group mx-auto grid max-w-5xl items-center gap-0 overflow-hidden rounded-2xl border border-border shadow-sm transition-shadow duration-700 hover:shadow-xl lg:grid-cols-2"
			>
				<div class="h-64 overflow-hidden lg:h-full">
					<img
						src={assetUrl(venture.image)}
						alt={venture.imageAlt ?? venture.title}
						class="h-full w-full object-cover transition-transform duration-1200 ease-out group-hover:scale-105"
					/>
				</div>
				<div class="bg-card p-8 sm:p-10">
					<div use:reveal={{ delay: 250, scale: 0.8, y: 12 }}>
						<DynamicIcon name={venture.icon} fallback="Stethoscope" class="size-10 text-primary" />
					</div>
					<h2 use:reveal={{ delay: 330 }} class="mt-4 font-heading text-3xl font-bold">
						{venture.title}
					</h2>
					<div use:reveal={{ delay: 400, y: 0 }} class="reveal-rule mt-4 h-px w-16 bg-primary"></div>
					<p use:reveal={{ delay: 430 }} class="mt-4 text-muted-foreground">
						{venture.description}
					</p>

					{#if venture.regionsServed?.length}
						<div class="mt-8">
							<p
								use:reveal={{ delay: 520 }}
								class="flex items-center gap-2 text-sm font-semibold tracking-wide text-foreground uppercase"
							>
								<MapPin class="size-4 text-primary" /> Regions Served
							</p>
							<div class="mt-4 flex flex-wrap gap-3">
								{#each venture.regionsServed as region, i (region)}
									<span
										use:reveal={{ delay: 600 + stagger(i, 80), y: 14, scale: 0.94, duration: 700 }}
										class="rounded-full border border-border bg-muted/50 px-4 py-1.5 text-sm font-medium transition-colors duration-300 hover:border-primary/50 hover:bg-primary/10"
									>
										{region}
									</span>
								{/each}
							</div>
						</div>
					{/if}
				</div>
			</div>
		</div>
	{/each}
</section>

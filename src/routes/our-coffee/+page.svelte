<script lang="ts">
	import { Card, CardContent } from '$lib/components/ui/card';
	import { Badge } from '$lib/components/ui/badge';
	import FaqSection from '$lib/components/faq-section.svelte';
	import ImageGallery from '$lib/components/image-gallery.svelte';
	import PageHero from '$lib/components/page-hero.svelte';
	import SectionHeading from '$lib/components/section-heading.svelte';
	import FarmCards from '$lib/components/farm-cards.svelte';
	import { reveal, stagger } from '$lib/actions/reveal';
	import type { PageData } from './$types';

	let { data }: { data: PageData } = $props();

	/** The sub-region table is introduced by the farm the rows belong to. */
	const subRegionFarm = $derived(data.subRegions[0]?.farmName);
</script>

<svelte:head>
	<title>Our Coffee | Fahem General Trading</title>
</svelte:head>

{#if data.hero}
	<PageHero hero={data.hero} />
{/if}

<!-- Farms -->
<section class="py-16">
	<div class="container mx-auto px-4 sm:px-6">
		<SectionHeading title="Our Farms" />
		<div class="mt-12">
			<FarmCards farms={data.farms} showStats />
		</div>

		{#if data.subRegions.length}
			<div class="mx-auto mt-16 max-w-4xl">
				<h3 use:reveal class="text-center text-xl font-semibold">
					{subRegionFarm} — Sub-regions & Profiles
				</h3>
				<div
					use:reveal={{ delay: 120, y: 28 }}
					class="mt-6 overflow-x-auto rounded-xl border border-border"
				>
					<table class="w-full text-left text-sm">
						<thead class="bg-muted/50">
							<tr>
								<th class="px-4 py-3 font-semibold">Region</th>
								<th class="px-4 py-3 font-semibold">Altitude</th>
								<th class="px-4 py-3 font-semibold">Characteristics</th>
							</tr>
						</thead>
						<tbody>
							{#each data.subRegions as row, i (row.name)}
								<tr
									use:reveal={{ delay: 200 + stagger(i, 70), y: 12, duration: 700 }}
									class="border-t border-border transition-colors duration-300 hover:bg-muted/40"
								>
									<td class="px-4 py-3 font-medium">{row.name}</td>
									<td class="px-4 py-3 text-muted-foreground">{row.altitude}</td>
									<td class="px-4 py-3 text-muted-foreground">{row.notes}</td>
								</tr>
							{/each}
						</tbody>
					</table>
				</div>
			</div>
		{/if}
	</div>
</section>

<!-- Regional flavor profiles -->
<section class="bg-muted/30 py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<SectionHeading
			title="Regions & Tasting Profiles"
			subtitle="Distinct Ethiopian origins, each with its own signature cup."
		/>
		<div class="mt-14 grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
			{#each data.regions as region, i (region.id)}
				<div use:reveal={{ delay: stagger(i, 80), y: 28, scale: 0.97 }} class="h-full">
					<Card class="lift h-full hover:border-primary/40 hover:shadow-lg">
						<CardContent class="pt-6">
							<h3 class="font-heading text-lg font-semibold">{region.name}</h3>
							<div class="mt-3 flex flex-wrap gap-1.5">
								{#each region.cupping?.split(', ') ?? [] as note (note)}
									<Badge variant="secondary" class="font-normal">{note}</Badge>
								{/each}
							</div>
							<p class="mt-4 text-sm">
								<span class="font-medium text-foreground">Aroma:</span>
								<span class="text-muted-foreground">{region.aroma}</span>
							</p>
							<p class="mt-2 text-sm">
								<span class="font-medium text-foreground">Flavor:</span>
								<span class="text-muted-foreground">{region.flavor}</span>
							</p>
						</CardContent>
					</Card>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- Traceability -->
<section class="py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<SectionHeading
			title="Harvesting to Packing"
			subtitle="Full traceability, documented at every stage from cherry to container."
		/>
	</div>
	<div
		use:reveal={{ delay: 200, y: 40, duration: 1100 }}
		class="container mx-auto mt-12 px-4 sm:px-6"
	>
		<ImageGallery images={data.gallery} />
	</div>
	<div class="container mx-auto px-4 sm:px-6">
		<ol class="mx-auto mt-12 max-w-2xl space-y-4">
			{#each data.steps as step, i (step.id)}
				<li use:reveal={{ delay: stagger(i, 60, 3), x: -16, y: 8, duration: 750 }} class="flex gap-4">
					<span
						class="flex size-8 shrink-0 items-center justify-center rounded-full bg-primary text-sm font-semibold text-primary-foreground"
					>
						{i + 1}
					</span>
					<p class="pt-1 text-sm text-muted-foreground">
						<span class="font-medium text-foreground">{step.title}</span>
						{#if step.description}— {step.description}{/if}
					</p>
				</li>
			{/each}
		</ol>
	</div>
</section>

<FaqSection faqs={data.faqs} class="bg-muted/30" />

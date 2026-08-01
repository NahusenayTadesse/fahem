<script lang="ts">
	import { Card, CardContent } from '$lib/components/ui/card';
	import ImageGallery from '$lib/components/image-gallery.svelte';
	import PageHero from '$lib/components/page-hero.svelte';
	import SectionHeading from '$lib/components/section-heading.svelte';
	import MilestoneCards from '$lib/components/milestone-cards.svelte';
	import FaqSection from '$lib/components/faq-section.svelte';
	import DynamicIcon from '$lib/components/dynamic-icon.svelte';
	import { reveal, stagger } from '$lib/actions/reveal';
	import { ShieldCheck } from '@lucide/svelte';
	import type { PageData } from './$types';

	let { data }: { data: PageData } = $props();
</script>

<svelte:head>
	<title>About Us | Fahem General Trading</title>
</svelte:head>

{#if data.hero}
	<PageHero hero={data.hero} />
{/if}

<!-- Founder story -->
<section class="bg-muted/30 py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<div class="grid items-center gap-12 lg:grid-cols-2">
			<div
				use:reveal={{ x: -32, y: 0, scale: 0.97, duration: 1100 }}
				class="group overflow-hidden rounded-2xl border border-border shadow-sm"
			>
				<img
					src="/image1.webp"
					alt="Hands sorting freshly picked coffee cherries into a bucket"
					class="aspect-4/3 w-full object-cover transition-transform duration-1200 ease-out group-hover:scale-105"
				/>
			</div>
			<div>
				<SectionHeading title="Our Origin" align="start" rule />
				<p use:reveal={{ delay: 140 }} class="mt-6 text-lg text-muted-foreground">
					Fahem General Trading traces its origins to Mohammed Lalo and Mohammed Muzeyin, who
					transitioned from selling used clothing to coffee picking in the late 1990s. That hands-on
					experience inspired their vision to become regional coffee suppliers by the early 2000s —
					a transformation from local trade into a name trusted at global standards, while remaining
					true to the soil and the craft.
				</p>
			</div>
		</div>
	</div>
</section>

<!-- Timeline -->
<section class="py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<SectionHeading title="Our Journey" />
		<div class="mx-auto mt-14 max-w-5xl">
			<MilestoneCards milestones={data.milestones} columns="sm:grid-cols-2 lg:grid-cols-4" />
		</div>
	</div>

	<div
		use:reveal={{ y: 40, scale: 0.98, duration: 1200 }}
		class="group mx-auto mt-16 max-w-6xl overflow-hidden rounded-2xl border border-border px-4 sm:px-6"
	>
		<img
			src="/farm.webp"
			alt="Aerial view of coffee farmland rows in Oromia"
			class="aspect-21/9 w-full object-cover transition-transform duration-1200 ease-out group-hover:scale-105"
		/>
	</div>
</section>

<!-- Why Fahem -->
<section class="relative isolate overflow-hidden py-20 text-primary-foreground">
	<img src="/coffee.webp" alt="" class="absolute inset-0 -z-20 h-full w-full object-cover" />
	<div class="absolute inset-0 -z-10 bg-primary/90"></div>
	<div class="container mx-auto px-4 sm:px-6">
		<h2 use:reveal class="text-center font-heading text-3xl font-bold md:text-4xl">Why Fahem</h2>
		<div class="mx-auto mt-14 grid max-w-4xl gap-8 md:grid-cols-3">
			{#each data.whyFahem as item, i (item.id)}
				<div use:reveal={{ delay: stagger(i, 140), y: 28, scale: 0.97 }} class="group text-center">
					<DynamicIcon
						name={item.icon}
						class="mx-auto size-8 transition-transform duration-500 group-hover:-translate-y-1"
					/>
					<h3 class="mt-4 text-xl font-semibold">{item.title}</h3>
					<p class="mt-2 text-sm opacity-90">{item.description}</p>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- Gallery -->
<section class="py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<SectionHeading title="Our World" subtitle="Moments from the farms, the fields, and the roast." />
	</div>
	<div
		use:reveal={{ delay: 200, y: 40, duration: 1100 }}
		class="container mx-auto mt-12 px-4 sm:px-6"
	>
		<ImageGallery images={data.gallery} />
	</div>
</section>

<!-- Certifications & Partners -->
<section class="bg-muted/30 py-20">
	<div class="container mx-auto px-4 text-center sm:px-6">
		<div use:reveal={{ scale: 0.8, y: 12 }}>
			<ShieldCheck class="mx-auto size-8 text-primary" />
		</div>
		<h2 use:reveal={{ delay: 100 }} class="mt-4 font-heading text-3xl font-bold md:text-4xl">
			Certified & Trusted
		</h2>
		<p use:reveal={{ delay: 200 }} class="mx-auto mt-4 max-w-xl text-muted-foreground">
			We work alongside leading names in the global coffee trade.
		</p>
		<div class="mx-auto mt-10 grid max-w-3xl grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-5">
			{#each data.partners as partner, i (partner.id)}
				<div use:reveal={{ delay: 280 + stagger(i, 80), y: 20, scale: 0.96 }}>
					<Card class="lift h-full hover:border-primary/40 hover:shadow-md">
						<CardContent class="flex items-center justify-center py-8 text-sm font-medium">
							{partner.name}
						</CardContent>
					</Card>
				</div>
			{/each}
		</div>
	</div>
</section>

<FaqSection faqs={data.faqs} subtitle="More about who we are and how we work." />

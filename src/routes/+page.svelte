<script lang="ts">
	import { Button } from '$lib/components/ui/button';
	import { Card, CardContent } from '$lib/components/ui/card';
	import ImageGallery from '$lib/components/image-gallery.svelte';
	import PageHero from '$lib/components/page-hero.svelte';
	import SectionHeading from '$lib/components/section-heading.svelte';
	import FarmCards from '$lib/components/farm-cards.svelte';
	import MilestoneCards from '$lib/components/milestone-cards.svelte';
	import FaqSection from '$lib/components/faq-section.svelte';
	import { reveal, stagger } from '$lib/actions/reveal';
	import { Globe, Leaf, ArrowRight } from '@lucide/svelte';
	import type { PageData } from './$types';

	let { data }: { data: PageData } = $props();
</script>

<svelte:head>
	<title>Fahem General Trading | Ethiopian Coffee, Harvested with Pride</title>
</svelte:head>

{#if data.hero}
	<PageHero hero={data.hero} size="lg">
		<div
			class="enter-up mt-10 flex flex-wrap items-center justify-center gap-4"
			style="--enter-delay: 680ms"
		>
			<Button href="/our-coffee" size="lg" class="gap-2">
				Explore Our Coffee <ArrowRight class="size-4" />
			</Button>
			<Button
				href="/about"
				size="lg"
				variant="outline"
				class="border-white/40 bg-white/5 text-white hover:bg-white/10 hover:text-white"
			>
				Our Story
			</Button>
		</div>
	</PageHero>
{/if}

<!-- Our Coffee highlight -->
<section class="bg-muted/30 py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<div class="grid items-center gap-12 lg:grid-cols-2">
			<div>
				<SectionHeading title="Our Coffee" align="start" rule />
				<p use:reveal={{ delay: 120 }} class="mt-6 text-lg text-muted-foreground">
					Grown across Ethiopia's most celebrated origins, our Arabica beans carry flavor profiles
					ranging from sweet and citrusy to deep, dark chocolatey notes — a reflection of the soil,
					altitude, and care behind every harvest.
				</p>
				<div use:reveal={{ delay: 240 }}>
					<Button href="/our-coffee" variant="link" class="group mt-2 gap-1 px-0 text-primary">
						See our regions and farms
						<ArrowRight
							class="size-4 transition-transform duration-500 group-hover:translate-x-1"
						/>
					</Button>
				</div>
			</div>
			<div
				use:reveal={{ x: 32, y: 0, scale: 0.97, duration: 1100 }}
				class="group overflow-hidden rounded-2xl border border-border shadow-sm"
			>
				<img
					src="/image2.webp"
					alt="A cup of brewed coffee resting on a bed of green and roasted beans"
					class="aspect-4/3 w-full object-cover transition-transform duration-1200 ease-out group-hover:scale-105"
				/>
			</div>
		</div>

		<div class="mt-16 grid grid-cols-2 gap-4 sm:grid-cols-4">
			{#each data.products as product, i (product.id)}
				<div use:reveal={{ delay: stagger(i, 70), y: 20, scale: 0.97 }}>
					<Card class="lift h-full text-center hover:border-primary/40 hover:shadow-md">
						<CardContent class="py-6">
							<p class="font-heading text-lg font-semibold">{product.name}</p>
							<p class="text-sm text-muted-foreground">{product.grade}</p>
						</CardContent>
					</Card>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- Origin story -->
<section class="py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<div class="grid items-center gap-12 lg:grid-cols-2">
			<div
				use:reveal={{ x: -32, y: 0, scale: 0.97, duration: 1100 }}
				class="group order-2 overflow-hidden rounded-2xl border border-border shadow-sm lg:order-1"
			>
				<img
					src="/image1.webp"
					alt="Hands sorting freshly picked coffee cherries into a bucket"
					class="aspect-4/3 w-full object-cover transition-transform duration-1200 ease-out group-hover:scale-105"
				/>
			</div>
			<div class="order-1 lg:order-2">
				<SectionHeading title="From Bean to Beyond" align="start" rule />
				<p use:reveal={{ delay: 140 }} class="mt-6 text-lg text-muted-foreground">
					What began as a humble endeavor in the local market evolved into a profound dedication to
					crafting and supplying the finest coffee beans Ethiopia has to offer.
				</p>
			</div>
		</div>

		<div class="mt-16">
			<MilestoneCards milestones={data.milestones} highlightLast />
		</div>
	</div>
</section>

<!-- Farms -->
<section class="bg-muted/30 py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<SectionHeading
			title="Our Farms"
			subtitle="Three farms, three distinct terroirs, one shared commitment to quality."
		/>
		<div class="mt-14">
			<FarmCards farms={data.farms} />
		</div>
	</div>
</section>

<!-- Global reach -->
<section class="relative isolate overflow-hidden py-20 text-primary-foreground">
	<img src="/coffee.webp" alt="" class="absolute inset-0 -z-20 h-full w-full object-cover" />
	<div class="absolute inset-0 -z-10 bg-primary/70"></div>
	<div class="container mx-auto px-4 text-center sm:px-6">
		<div use:reveal={{ scale: 0.8, y: 12 }}>
			<Globe class="mx-auto size-10" />
		</div>
		<h2 use:reveal={{ delay: 100 }} class="mt-4 font-heading text-3xl font-bold md:text-4xl">
			A Global Reach
		</h2>
		<p use:reveal={{ delay: 200 }} class="mx-auto mt-4 max-w-2xl text-lg opacity-90">
			Our coffee travels from the highlands of Jimma to tables across the world.
		</p>
		<div class="mx-auto mt-10 grid max-w-2xl grid-cols-2 gap-6 sm:grid-cols-4">
			{#each data.markets as market, i (market.id)}
				<div
					use:reveal={{ delay: 300 + stagger(i, 90), y: 20, scale: 0.96 }}
					class="lift rounded-lg border border-primary-foreground/20 bg-primary-foreground/5 py-4 backdrop-blur-sm hover:border-primary-foreground/40 hover:bg-primary-foreground/10"
				>
					<p class="font-heading font-semibold">{market.name}</p>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- Gallery -->
<section class="py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<SectionHeading title="From Farm to Cup" subtitle="A glimpse into the life of every harvest." />
	</div>
	<div
		use:reveal={{ delay: 200, y: 40, duration: 1100 }}
		class="container mx-auto mt-12 px-4 sm:px-6"
	>
		<ImageGallery images={data.gallery} />
	</div>
</section>

<FaqSection
	faqs={data.faqs}
	subtitle="The questions buyers ask us most often."
	class="bg-muted/30"
/>

<!-- CTA -->
<section class="relative isolate overflow-hidden py-28">
	<img
		src="/image5.webp"
		alt="A cup of coffee resting in a sea of ripe coffee cherries"
		class="absolute inset-0 -z-20 h-full w-full object-cover"
	/>
	<div class="absolute inset-0 -z-10 bg-linear-to-b from-black/75 via-black/70 to-black/80"></div>
	<div class="container mx-auto px-4 text-center sm:px-6">
		<div use:reveal={{ scale: 0.8, y: 12 }}>
			<Leaf class="mx-auto size-8 text-secondary" />
		</div>
		<h2
			use:reveal={{ delay: 100, y: 28, blur: 4, duration: 1100 }}
			class="mt-4 font-heading text-3xl font-bold text-white md:text-4xl"
		>
			Let's Work Together
		</h2>
		<p use:reveal={{ delay: 220 }} class="mx-auto mt-4 max-w-xl text-white/85">
			Interested in sourcing premium Ethiopian coffee, or learning more about our ventures? We'd
			love to hear from you.
		</p>
		<div use:reveal={{ delay: 340 }}>
			<Button href="/contact" size="lg" class="mt-8">Get in Touch</Button>
		</div>
	</div>
</section>

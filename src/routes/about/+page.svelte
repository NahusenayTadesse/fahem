<script lang="ts">
	import { Card, CardContent } from '$lib/components/ui/card';
	import ImageGallery from '$lib/components/image-gallery.svelte';
	import { reveal, stagger } from '$lib/actions/reveal';
	import { Users, Leaf, ShieldCheck, HandCoins } from '@lucide/svelte';

	const timeline = [
		{
			year: 'Late 1990s',
			title: 'Humble Beginnings',
			description:
				'Mohammed Lalo and Mohammed Muzeyin transition from selling used clothing to coffee picking, sparking a lifelong passion.'
		},
		{
			year: '2006',
			title: 'Land Acquired',
			description:
				'Acquired farmland in the Oromia Limmu region, laying the foundation for our plantations.'
		},
		{
			year: '2013',
			title: 'Going Global',
			description: 'Began international export operations, bringing Ethiopian coffee to the world.'
		},
		{
			year: 'Ongoing',
			title: 'ECX Partner',
			description:
				'An active participant in the Ethiopian Commodity Exchange, sourcing and trading premium beans.'
		}
	];

	const whyFahem = [
		{
			icon: Users,
			title: 'Empowering Agriculture',
			description:
				'We support farmers with essential supplies and expertise, fostering a thriving agricultural sector.'
		},
		{
			icon: Leaf,
			title: 'Sustainable Practices',
			description:
				'Committed to environmental responsibility, we champion sustainable farming methods.'
		},
		{
			icon: HandCoins,
			title: 'Trusted Partner',
			description:
				'We prioritize the satisfaction of all stakeholders, building lasting relationships.'
		}
	];

	const partners = ['Coffee Ithaka', 'Ecom Trading', 'LDC', 'Touton', 'Falcon Coffees'];

	const gallery = [
		{
			src: '/image2.webp',
			alt: 'A cup of coffee resting on roasted and green beans',
			caption: 'The final cup'
		},
		{
			src: '/image5.webp',
			alt: 'A cup of coffee amid a sea of ripe cherries',
			caption: 'From cherry to cup'
		},
		{ src: '/image7.webp', alt: 'A pile of roasted coffee beans', caption: 'Freshly roasted' },
		{ src: '/image9.webp', alt: 'Overhead view of a roasting pan of beans', caption: 'The roast' },
		{
			src: '/image11.webp',
			alt: 'Workers tending vast drying beds at sunset',
			caption: 'The drying beds'
		}
	];
</script>

<svelte:head>
	<title>About Us | Fahem General Trading</title>
</svelte:head>

<!-- Hero -->
<section class="relative isolate overflow-hidden py-28 lg:py-36">
	<img
		src="/image14.webp"
		alt="Hand cradling a basket of ripe coffee cherries"
		class="enter-kenburns absolute inset-0 -z-20 h-full w-full object-cover"
	/>
	<div
		class="enter-fade absolute inset-0 -z-10 bg-linear-to-b from-black/75 via-black/60 to-black/85"
		style="--enter-duration: 1400ms"
	></div>
	<div class="container mx-auto px-4 text-center sm:px-6">
		<h1
			class="enter-rise font-heading text-5xl font-bold tracking-tight text-white md:text-6xl"
			style="--enter-delay: 150ms"
		>
			About Us
		</h1>
		<p class="enter-up mt-4 text-xl text-white/85" style="--enter-delay: 380ms">
			Fahem Coffee Plantation: From Bean to Beyond
		</p>
		<p class="enter-up mx-auto mt-8 max-w-2xl text-lg text-white/80" style="--enter-delay: 520ms">
			We operate in sourcing, trading, and coffee plantation sectors — a major player in the
			Ethiopian coffee industry, contributing to the ECX and exporting premium beans globally.
		</p>
	</div>
</section>

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
				<h2 use:reveal class="font-heading text-3xl font-bold md:text-4xl">Our Origin</h2>
				<div use:reveal={{ delay: 120, y: 0 }} class="reveal-rule mt-4 h-px w-16 bg-primary"></div>
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
		<h2 use:reveal class="text-center font-heading text-3xl font-bold md:text-4xl">Our Journey</h2>
		<div class="mx-auto mt-14 grid max-w-5xl gap-6 sm:grid-cols-2 lg:grid-cols-4">
			{#each timeline as stage, i (stage.title)}
				<div
					use:reveal={{ delay: stagger(i, 120), y: 32 }}
					class="lift rounded-xl border border-border bg-card p-6 hover:border-primary/40 hover:shadow-lg"
				>
					<div class="text-sm font-bold text-primary">{stage.year}</div>
					<h3 class="mt-2 text-lg font-semibold">{stage.title}</h3>
					<p class="mt-3 text-sm text-muted-foreground">{stage.description}</p>
				</div>
			{/each}
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
			{#each whyFahem as item, i (item.title)}
				{@const Icon = item.icon}
				<div use:reveal={{ delay: stagger(i, 140), y: 28, scale: 0.97 }} class="group text-center">
					<Icon
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
		<div class="mx-auto max-w-2xl text-center">
			<h2 use:reveal class="font-heading text-3xl font-bold md:text-4xl">Our World</h2>
			<p use:reveal={{ delay: 120 }} class="mt-4 text-muted-foreground">
				Moments from the farms, the fields, and the roast.
			</p>
		</div>
	</div>
	<div
		use:reveal={{ delay: 200, y: 40, duration: 1100 }}
		class="container mx-auto mt-12 px-4 sm:px-6"
	>
		<ImageGallery images={gallery} />
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
			{#each partners as partner, i (partner)}
				<div use:reveal={{ delay: 280 + stagger(i, 80), y: 20, scale: 0.96 }}>
					<Card class="lift h-full hover:border-primary/40 hover:shadow-md">
						<CardContent class="flex items-center justify-center py-8 text-sm font-medium">
							{partner}
						</CardContent>
					</Card>
				</div>
			{/each}
		</div>
	</div>
</section>

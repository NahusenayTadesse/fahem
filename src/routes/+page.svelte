<script lang="ts">
	import { Button } from '$lib/components/ui/button';
	import { Card, CardContent } from '$lib/components/ui/card';
	import ImageGallery from '$lib/components/image-gallery.svelte';
	import { reveal, stagger } from '$lib/actions/reveal';
	import { Globe, Leaf, Sprout, ArrowRight } from '@lucide/svelte';

	const products = [
		{ name: 'Limmu', grade: 'Grade 2' },
		{ name: 'Djimmah', grade: 'Grade 4' },
		{ name: 'Djimmah', grade: 'Grade 5' },
		{ name: 'Sidamo', grade: 'Grade 2' },
		{ name: 'Sidamo', grade: 'Grade 4' },
		{ name: 'Yirgacheffe', grade: 'Grade 2' },
		{ name: 'Yirgacheffe', grade: 'Grade 4' },
		{ name: 'Gera', grade: 'Grade 1' }
	];

	const farms = [
		{
			name: 'Atnago Farm',
			location: 'Limmu, Oromia',
			image: '/image8.webp',
			description:
				'200 hectares with washing stations, drying mills, and 22 tree species for shade, processing coffee from over 5,000 out-growers.'
		},
		{
			name: 'Gera Farm',
			location: 'Gera Woreda',
			image: '/image4.webp',
			description:
				'150 hectares at 1,900–2,100m, producing Specialty Grade 1 coffee — sweet, creamy, and floral with a distinctive rue aftertaste.'
		},
		{
			name: 'Gambella Farm',
			location: 'Godere Zone',
			image: '/image13.webp',
			description:
				'300 hectares at 1,900m, growing toward 250,000kg annual capacity with exquisite floral and spicy notes.'
		}
	];

	const timeline = [
		{
			period: 'Late 1990s',
			title: 'The Foundation',
			description:
				'Founded by Mohammed Lalo and Mohammed Muzeyin, who began their journey as local used-clothes merchants.'
		},
		{
			period: 'The Discovery',
			title: 'Becoming Pickers',
			description:
				'Their hands first touched the earth as they transitioned into coffee pickers, discovering the magic within the bean.'
		},
		{
			period: 'Early 2000s',
			title: 'Becoming Suppliers',
			description:
				'The vision crystallized into action as they became local coffee suppliers, committed to the trade.'
		}
	];

	const gallery = [
		{
			src: '/image10.webp',
			alt: 'Coffee drying beds beneath a thatched hut',
			caption: 'Sun-drying at the farm'
		},
		{
			src: '/image11.webp',
			alt: 'Workers tending vast drying beds at sunset',
			caption: 'Golden hour on the beds'
		},
		{
			src: '/image14.webp',
			alt: 'Hand cradling a basket of ripe cherries',
			caption: 'Cherry by cherry'
		},
		{
			src: '/image6.webp',
			alt: 'Hands sorting cherries at a washing station',
			caption: 'Sorting for quality'
		},
		{ src: '/image9.webp', alt: 'Roasting pan of coffee beans', caption: 'The roast' },
		{ src: '/image3.webp', alt: 'Sack overflowing with roasted beans', caption: 'Ready for export' }
	];
</script>

<svelte:head>
	<title>Fahem General Trading | Ethiopian Coffee, Harvested with Pride</title>
</svelte:head>

<!-- Hero -->
<section class="relative isolate overflow-hidden py-32 lg:py-44">
	<img
		src="/hero.webp"
		alt="Ripe coffee cherries poured between hand-woven baskets"
		class="enter-kenburns absolute inset-0 -z-20 h-full w-full object-cover"
	/>
	<div
		class="enter-fade absolute inset-0 -z-10 bg-linear-to-b from-black/70 via-black/55 to-black/80"
		style="--enter-duration: 1400ms"
	></div>
	<div class="container mx-auto px-4 text-center sm:px-6">
		<p
			class="enter-down mb-4 text-sm font-semibold tracking-widest text-primary-foreground/90 uppercase"
			style="--enter-delay: 150ms"
		>
			Fahem General Trading PLC
		</p>
		<h1
			class="enter-rise mx-auto max-w-4xl font-heading text-5xl font-bold tracking-tight text-balance text-white md:text-7xl"
			style="--enter-delay: 250ms"
		>
			Harvested with pride, <span class="text-primary">shared with passion</span>
		</h1>
		<p class="enter-up mx-auto mt-8 max-w-2xl text-lg text-white/85" style="--enter-delay: 500ms">
			We source top-quality beans from the legendary Jimma Zone and beyond, for specialty and
			commercial markets — blending tradition with innovation.
		</p>
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
	</div>
</section>

<!-- Our Coffee highlight -->
<section class="bg-muted/30 py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<div class="grid items-center gap-12 lg:grid-cols-2">
			<div>
				<h2 use:reveal class="font-heading text-3xl font-bold md:text-4xl">Our Coffee</h2>
				<div use:reveal={{ delay: 120, y: 0 }} class="reveal-rule mt-4 h-px w-16 bg-primary"></div>
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
			{#each products as product, i (product.name + product.grade)}
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
				<h2 use:reveal class="font-heading text-3xl font-bold md:text-4xl">From Bean to Beyond</h2>
				<div use:reveal={{ delay: 120, y: 0 }} class="reveal-rule mt-4 h-px w-16 bg-primary"></div>
				<p use:reveal={{ delay: 140 }} class="mt-6 text-lg text-muted-foreground">
					What began as a humble endeavor in the local market evolved into a profound dedication to
					crafting and supplying the finest coffee beans Ethiopia has to offer.
				</p>
			</div>
		</div>

		<div class="mt-16 grid gap-8 md:grid-cols-3">
			{#each timeline as stage, i (stage.title)}
				<div
					use:reveal={{ delay: stagger(i, 130), y: 32 }}
					class="lift relative rounded-xl border border-border bg-card p-6 hover:border-primary/40 hover:shadow-lg {i ===
					2
						? 'ring-2 ring-primary/50'
						: ''}"
				>
					<div class="text-sm font-bold text-primary">{stage.period}</div>
					<h3 class="mt-2 text-xl font-semibold">{stage.title}</h3>
					<p class="mt-3 text-sm text-muted-foreground">{stage.description}</p>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- Farms -->
<section class="bg-muted/30 py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<div class="mx-auto max-w-2xl text-center">
			<h2 use:reveal class="font-heading text-3xl font-bold md:text-4xl">Our Farms</h2>
			<p use:reveal={{ delay: 120 }} class="mt-4 text-muted-foreground">
				Three farms, three distinct terroirs, one shared commitment to quality.
			</p>
		</div>
		<div class="mt-14 grid gap-6 md:grid-cols-3">
			{#each farms as farm, i (farm.name)}
				<div use:reveal={{ delay: stagger(i, 130), y: 36, scale: 0.98, duration: 1000 }}>
					<Card class="lift group h-full overflow-hidden hover:border-primary/40 hover:shadow-xl">
						<div class="overflow-hidden">
							<img
								src={farm.image}
								alt={farm.name}
								class="aspect-video w-full object-cover transition-transform duration-1200 ease-out group-hover:scale-105"
							/>
						</div>
						<CardContent class="pt-6 pb-6">
							<Sprout
								class="size-8 text-primary transition-transform duration-500 group-hover:-translate-y-0.5"
							/>
							<h3 class="mt-4 text-xl font-semibold">{farm.name}</h3>
							<p class="text-sm font-medium text-primary">{farm.location}</p>
							<p class="mt-3 text-sm text-muted-foreground">{farm.description}</p>
						</CardContent>
					</Card>
				</div>
			{/each}
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
			Our coffee travels from the highlands of Jimma to tables across North America, Europe,
			Australia, and Asia.
		</p>
		<div class="mx-auto mt-10 grid max-w-2xl grid-cols-2 gap-6 sm:grid-cols-4">
			{#each ['North America', 'Europe', 'Australia', 'Asia'] as region, i (region)}
				<div
					use:reveal={{ delay: 300 + stagger(i, 90), y: 20, scale: 0.96 }}
					class="lift rounded-lg border border-primary-foreground/20 bg-primary-foreground/5 py-4 backdrop-blur-sm hover:border-primary-foreground/40 hover:bg-primary-foreground/10"
				>
					<p class="font-heading font-semibold">{region}</p>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- Gallery -->
<section class="py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<div class="mx-auto max-w-2xl text-center">
			<h2 use:reveal class="font-heading text-3xl font-bold md:text-4xl">From Farm to Cup</h2>
			<p use:reveal={{ delay: 120 }} class="mt-4 text-muted-foreground">
				A glimpse into the life of every harvest.
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

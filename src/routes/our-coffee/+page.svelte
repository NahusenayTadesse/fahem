<script lang="ts">
	import { Card, CardContent } from '$lib/components/ui/card';
	import { Badge } from '$lib/components/ui/badge';
	import {
		Accordion,
		AccordionContent,
		AccordionItem,
		AccordionTrigger,
	} from '$lib/components/ui/accordion';
	import ImageGallery from '$lib/components/image-gallery.svelte';
	import { Sprout } from '@lucide/svelte';

	const gallery = [
		{ src: '/image1.webp', alt: 'Hands sorting freshly picked coffee cherries', caption: 'Selective harvest' },
		{ src: '/image10.webp', alt: 'Coffee drying beds beneath a thatched hut', caption: 'Sun-drying' },
		{ src: '/image11.webp', alt: 'Workers tending vast drying beds at sunset', caption: 'Turning the beds' },
		{ src: '/image6.webp', alt: 'Hands sorting cherries at a washing station', caption: 'Wet processing' },
		{ src: '/image14.webp', alt: 'Hand cradling a basket of ripe cherries', caption: 'Quality control' },
		{ src: '/image7.webp', alt: 'A pile of roasted coffee beans', caption: 'Ready to roast' },
	];

	const subRegions = [
		{ region: 'Limmu Kossa Woreda', altitude: '1750–2000m', notes: 'Sweet with a lingering spicy note' },
		{ region: 'Limmu Seqa Woreda', altitude: '1850–2100m', notes: 'Sweet, winey, and citrus notes' },
		{
			region: 'Manna Woreda',
			altitude: '1600–2000m',
			notes: 'Sweet and milky chocolate flavor with a medium body',
		},
		{
			region: 'Goma Woreda',
			altitude: '1550–1800m',
			notes: 'Dark chocolate, sweet notes, and medium acidic body',
		},
		{
			region: 'Djimmah Town',
			altitude: '1650–1780m',
			notes: 'Dark chocolate, sometimes with a mild acidity, and a medium to full body',
		},
	];

	const farms = [
		{
			name: 'Atnago Farm',
			location: 'Limmu, Oromia',
			image: '/image8.webp',
			stats: ['200 hectares (180 arable)', '22 tree species for shade', '5,000+ out-growers within 50km'],
			description:
				'Washing stations and drying mills process coffee from a wide network of out-growers across Limmu.',
		},
		{
			name: 'Gera Farm (Yukro)',
			location: 'Gera Woreda',
			image: '/image4.webp',
			stats: ['150 hectares', '1,900–2,100m altitude', 'Specialty Grade 1'],
			description: 'Sweet, creamy, floral profile with a distinctive rue aftertaste.',
		},
		{
			name: 'Gambella Farm',
			location: 'Godere Zone',
			image: '/image13.webp',
			stats: ['300 hectares', '1,900m altitude', '250,000kg annual capacity'],
			description: 'Exquisite floral and spicy notes, currently producing 20,000kg annually.',
		},
	];

	const regions = [
		{
			name: 'Yirgacheffe',
			cupping: 'Lemon, jasmine, and peach',
			aroma: 'Floral and citrusy',
			flavor: 'Bright, tea-like with notes of bergamot and stone fruits',
		},
		{
			name: 'Guji',
			cupping: 'Blueberry, apricot, and melon',
			aroma: 'Sweet and fruity',
			flavor: 'Complex with hints of berries and tropical fruits, wine-like acidity',
		},
		{
			name: 'Kaffa',
			cupping: 'Dark chocolate, spice, and wine',
			aroma: 'Earthy and rich',
			flavor: 'Full-bodied with notes of dark chocolate and spices, low acidity',
		},
		{
			name: 'Sidamo',
			cupping: 'Berry, citrus, floral, spice, and wine',
			aroma: 'Fruity and floral',
			flavor: 'Balanced with bright acidity and notes of lemon, berries, and floral undertones',
		},
		{
			name: 'Ghimbi',
			cupping: 'Chocolate, nutty, and sweet',
			aroma: 'Rich and smooth',
			flavor: 'Full-bodied with balanced acidity and notes of chocolate and nuts',
		},
		{
			name: 'Illubabor',
			cupping: 'Herbal, nutty, and mild spice',
			aroma: 'Earthy and herbal',
			flavor: 'Medium-bodied with mild acidity, notes of nuts and mild spices',
		},
		{
			name: 'Djimmah',
			cupping: 'Earthy, nutty, and woody',
			aroma: 'Earthy, nutty, and woody',
			flavor: 'Full-bodied with low acidity and notes of dark chocolate, nuts, and earthy undertones',
		},
		{
			name: 'Limmu',
			cupping: 'Fruity, spicy, and sweet',
			aroma: 'Fruity and spicy',
			flavor: 'Well-balanced with medium acidity and notes of tropical fruits, cinnamon, and caramel',
		},
	];

	const traceabilitySteps = [
		'Harvesting Red Cherry — members across 18 Kebeles & 4 districts, recorded by purchase voucher',
		'Coffee Collection — 114 collection centers, weight and code records',
		'Cherry Reception at processing sites — weight records, delivery notes, receiving vouchers',
		'Pulping — pulping records',
		'Parchment Drying — drying records',
		'Storage — delivery notes, receiving vouchers, bin cards, lot numbers, tags',
		'Addis Ababa Dispatch — store issue vouchers, coffee dispatch notes',
		'Addis Ababa Warehouse — delivery notes, truck registration, milling lot numbers',
		'Milling — milling records',
		'Packing — packing records',
		'Export / Transport — packing and dispatch registers, stock control, truck identification',
	];

	const faqs = [
		{
			q: 'How are you preparing for EUDR regulation?',
			a: 'Documentation is complete: GPS data collected using the Decimal Degrees system (6 decimal points), completed July 30, 2024, with polygon mapping completed for all farms over 4 hectares.',
		},
		{
			q: 'What is your annual export volume?',
			a: 'We currently export approximately 400 containers annually, with a goal of reaching 600 containers by 2025.',
		},
		{
			q: 'What is your processing timeline?',
			a: 'From order to container takes less than one month; the full order-to-delivery process takes approximately three months.',
		},
		{
			q: 'Do you offer direct trade options?',
			a: 'Yes — we offer direct trade and maintain established international buyer partnerships, alongside community initiatives such as farmer training on child labor and equality, elementary school construction, and agricultural tool distribution.',
		},
		{
			q: 'How do you support your farming community?',
			a: 'We provide coffee seedling raising and distribution, technical field support for out-growers, and infrastructure including two grain mills, roads, two school blocks, a kindergarten, and electric lines — alongside annual dividend, bonus, and premium distributions to our roughly 5,000 out-growers.',
		},
		{
			q: 'How do you ensure coffee traceability?',
			a: 'Every lot is tracked from harvesting to packing through a detailed chain of custody, documented at each stage from the farm to export.',
		},
	];
</script>

<svelte:head>
	<title>Our Coffee | Fahem General Trading</title>
</svelte:head>

<!-- Hero -->
<section class="relative isolate overflow-hidden py-28 lg:py-36">
	<img
		src="/coffee.webp"
		alt="Coffee beans spinning in a roasting drum"
		class="absolute inset-0 -z-20 h-full w-full object-cover"
	/>
	<div class="absolute inset-0 -z-10 bg-gradient-to-b from-black/75 via-black/60 to-black/80"></div>
	<div class="container mx-auto px-4 text-center sm:px-6">
		<h1 class="font-heading text-5xl font-bold tracking-tight text-white md:text-6xl">Our Coffee</h1>
		<p class="mt-4 text-xl text-white/85">Harvested with pride, shared with passion</p>
		<p class="mx-auto mt-8 max-w-2xl text-lg text-white/80">
			We source premium Arabica beans from Ethiopia's Jimma Zone, using selective harvesting of
			ripe cherries and adaptable processing methods tailored to customer preferences.
		</p>
	</div>
</section>

<!-- Farms -->
<section class="py-16">
	<div class="container mx-auto px-4 sm:px-6">
		<h2 class="font-heading text-center text-3xl font-bold md:text-4xl">Our Farms</h2>
		<div class="mt-12 grid gap-6 md:grid-cols-3">
			{#each farms as farm (farm.name)}
				<Card>
					<img src={farm.image} alt={farm.name} class="aspect-video w-full object-cover" />
					<CardContent class="pt-6">
						<Sprout class="size-8 text-primary" />
						<h3 class="mt-4 text-xl font-semibold">{farm.name}</h3>
						<p class="text-sm font-medium text-primary">{farm.location}</p>
						<ul class="mt-4 space-y-1">
							{#each farm.stats as stat (stat)}
								<li class="text-sm text-muted-foreground">{stat}</li>
							{/each}
						</ul>
						<p class="mt-4 text-sm text-muted-foreground">{farm.description}</p>
					</CardContent>
				</Card>
			{/each}
		</div>

		<!-- Atnago sub-regions -->
		<div class="mx-auto mt-16 max-w-4xl">
			<h3 class="text-center text-xl font-semibold">Atnago Farm — Sub-regions & Profiles</h3>
			<div class="mt-6 overflow-x-auto rounded-xl border border-border">
				<table class="w-full text-left text-sm">
					<thead class="bg-muted/50">
						<tr>
							<th class="px-4 py-3 font-semibold">Region</th>
							<th class="px-4 py-3 font-semibold">Altitude</th>
							<th class="px-4 py-3 font-semibold">Characteristics</th>
						</tr>
					</thead>
					<tbody>
						{#each subRegions as row (row.region)}
							<tr class="border-t border-border">
								<td class="px-4 py-3 font-medium">{row.region}</td>
								<td class="px-4 py-3 text-muted-foreground">{row.altitude}</td>
								<td class="px-4 py-3 text-muted-foreground">{row.notes}</td>
							</tr>
						{/each}
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

<!-- Regional flavor profiles -->
<section class="bg-muted/30 py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<div class="mx-auto max-w-2xl text-center">
			<h2 class="font-heading text-3xl font-bold md:text-4xl">Regions & Tasting Profiles</h2>
			<p class="mt-4 text-muted-foreground">
				Eight distinct Ethiopian origins, each with its own signature cup.
			</p>
		</div>
		<div class="mt-14 grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
			{#each regions as region (region.name)}
				<Card>
					<CardContent class="pt-6">
						<h3 class="font-heading text-lg font-semibold">{region.name}</h3>
						<div class="mt-3 flex flex-wrap gap-1.5">
							{#each region.cupping.split(', ') as note (note)}
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
			{/each}
		</div>
	</div>
</section>

<!-- Traceability -->
<section class="py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<div class="mx-auto max-w-2xl text-center">
			<h2 class="font-heading text-3xl font-bold md:text-4xl">Harvesting to Packing</h2>
			<p class="mt-4 text-muted-foreground">
				Full traceability, documented at every stage from cherry to container.
			</p>
		</div>
	</div>
	<div class="container mx-auto mt-12 px-4 sm:px-6">
		<ImageGallery images={gallery} />
	</div>
	<div class="container mx-auto px-4 sm:px-6">
		<ol class="mx-auto mt-12 max-w-2xl space-y-4">
			{#each traceabilitySteps as step, i (step)}
				<li class="flex gap-4">
					<span
						class="flex size-8 shrink-0 items-center justify-center rounded-full bg-primary text-sm font-semibold text-primary-foreground"
					>
						{i + 1}
					</span>
					<p class="pt-1 text-sm text-muted-foreground">{step}</p>
				</li>
			{/each}
		</ol>
	</div>
</section>

<!-- FAQ -->
<section class="bg-muted/30 py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<h2 class="font-heading text-center text-3xl font-bold md:text-4xl">Frequently Asked Questions</h2>
		<div class="mx-auto mt-12 max-w-3xl">
			<Accordion type="single" class="w-full">
				{#each faqs as faq, i (faq.q)}
					<AccordionItem value="item-{i}">
						<AccordionTrigger class="text-left">{faq.q}</AccordionTrigger>
						<AccordionContent class="text-muted-foreground">{faq.a}</AccordionContent>
					</AccordionItem>
				{/each}
			</Accordion>
		</div>
	</div>
</section>

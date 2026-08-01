<script lang="ts">
	import { reveal, stagger } from '$lib/actions/reveal';
	import { Stethoscope, MapPin } from '@lucide/svelte';

	const regions = ['Oromia', 'Amhara', 'Afar', 'South Ethiopia'];
</script>

<svelte:head>
	<title>Ventures | Fahem General Trading</title>
</svelte:head>

<!-- Hero -->
<section class="relative isolate overflow-hidden py-28 lg:py-36">
	<img
		src="/image8.webp"
		alt="Wide view of Ethiopian farmland with mountains in the distance"
		class="enter-kenburns absolute inset-0 -z-20 h-full w-full object-cover"
	/>
	<div
		class="enter-fade absolute inset-0 -z-10 bg-linear-to-b from-black/70 via-black/55 to-black/85"
		style="--enter-duration: 1400ms"
	></div>
	<div class="container mx-auto px-4 text-center sm:px-6">
		<h1
			class="enter-rise font-heading text-5xl font-bold tracking-tight text-white md:text-6xl"
			style="--enter-delay: 150ms"
		>
			Our Ventures
		</h1>
		<p class="enter-up mt-4 text-xl text-white/85" style="--enter-delay: 380ms">
			Harvested With Passion, Shared With Pride
		</p>
	</div>
</section>

<!-- Fahem Veterinary Medicine -->
<section class="py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<div
			use:reveal={{ y: 40, scale: 0.98, duration: 1100 }}
			class="group mx-auto grid max-w-5xl items-center gap-0 overflow-hidden rounded-2xl border border-border shadow-sm transition-shadow duration-700 hover:shadow-xl lg:grid-cols-2"
		>
			<div class="h-64 overflow-hidden lg:h-full">
				<img
					src="/farm.webp"
					alt="Aerial view of Ethiopian farmland"
					class="h-full w-full object-cover transition-transform duration-1200 ease-out group-hover:scale-105"
				/>
			</div>
			<div class="bg-card p-8 sm:p-10">
				<div use:reveal={{ delay: 250, scale: 0.8, y: 12 }}>
					<Stethoscope class="size-10 text-primary" />
				</div>
				<h2 use:reveal={{ delay: 330 }} class="mt-4 font-heading text-3xl font-bold">
					Fahem Veterinary Medicine
				</h2>
				<div use:reveal={{ delay: 400, y: 0 }} class="reveal-rule mt-4 h-px w-16 bg-primary"></div>
				<p use:reveal={{ delay: 430 }} class="mt-4 text-muted-foreground">
					The leading importer of veterinary drugs in Ethiopia. Established to serve the nation's
					expanding animal breeding industry, Fahem Veterinary Medicine supplies efficient and
					effective veterinary medicines, ensuring widespread access to animal health supplies.
				</p>

				<div class="mt-8">
					<p
						use:reveal={{ delay: 520 }}
						class="flex items-center gap-2 text-sm font-semibold tracking-wide text-foreground uppercase"
					>
						<MapPin class="size-4 text-primary" /> Regions Served
					</p>
					<div class="mt-4 flex flex-wrap gap-3">
						{#each regions as region, i (region)}
							<span
								use:reveal={{ delay: 600 + stagger(i, 80), y: 14, scale: 0.94, duration: 700 }}
								class="rounded-full border border-border bg-muted/50 px-4 py-1.5 text-sm font-medium transition-colors duration-300 hover:border-primary/50 hover:bg-primary/10"
							>
								{region}
							</span>
						{/each}
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

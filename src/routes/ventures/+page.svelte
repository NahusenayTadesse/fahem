<script lang="ts">
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
		class="absolute inset-0 -z-20 h-full w-full object-cover"
	/>
	<div class="absolute inset-0 -z-10 bg-gradient-to-b from-black/70 via-black/55 to-black/85"></div>
	<div class="container mx-auto px-4 text-center sm:px-6">
		<h1 class="font-heading text-5xl font-bold tracking-tight text-white md:text-6xl">Our Ventures</h1>
		<p class="mt-4 text-xl text-white/85">Harvested With Passion, Shared With Pride</p>
	</div>
</section>

<!-- Fahem Veterinary Medicine -->
<section class="py-20">
	<div class="container mx-auto px-4 sm:px-6">
		<div class="mx-auto grid max-w-5xl items-center gap-0 overflow-hidden rounded-2xl border border-border shadow-sm lg:grid-cols-2">
			<div class="h-64 lg:h-full">
				<img src="/farm.webp" alt="Aerial view of Ethiopian farmland" class="h-full w-full object-cover" />
			</div>
			<div class="bg-card p-8 sm:p-10">
				<Stethoscope class="size-10 text-primary" />
				<h2 class="font-heading mt-4 text-3xl font-bold">Fahem Veterinary Medicine</h2>
				<p class="mt-4 text-muted-foreground">
					The leading importer of veterinary drugs in Ethiopia. Established to serve the
					nation's expanding animal breeding industry, Fahem Veterinary Medicine supplies
					efficient and effective veterinary medicines, ensuring widespread access to animal
					health supplies.
				</p>

				<div class="mt-8">
					<p class="flex items-center gap-2 text-sm font-semibold tracking-wide text-foreground uppercase">
						<MapPin class="size-4 text-primary" /> Regions Served
					</p>
					<div class="mt-4 flex flex-wrap gap-3">
						{#each regions as region (region)}
							<span
								class="rounded-full border border-border bg-muted/50 px-4 py-1.5 text-sm font-medium"
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
